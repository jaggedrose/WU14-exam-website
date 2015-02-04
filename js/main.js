$(function() {


	function getPages(searchParam) {
		$.ajax ({
			url: "php/get_page_content.php",
			type: "get",
			dataType: "json",
			data: {
				"searchParam": searchParam
			},
			success: printPagesList,
			error: function(data) {
				console.log("getPages error: ", data);
			}
		});
	}

	function printPagesList(data) {
		console.log("printPages success: ", data);
		$("#pageList table tr").not(".pageListHeader").remove();
		// Get page data from DB and append to pageList
		for (var i = 0; i < data.length; i++) {
			var pageListInfo = $("<tr/>");
			// Add page list info to page
			pageListInfo.append("<th>"+data[i]["pid"]+"</th>");
			pageListInfo.append("<th>"+data[i]["title"]+"</th>");
			pageListInfo.append("<td>"+data[i]["author"]+"</td>");
			pageListInfo.append("<td>"+data[i]["created"]+"</td>");
			// pageListInfo.append('<td>'+data[i]["updated"]+"</td>");
			$("#pageList table").append(pageListInfo);
		}
	}

	// Clickhandler for admin form
	$("#adminFormBtn").click(function() {

		var pageData = {};
		pageData[":title"] = $("#pageTitle").val();
		pageData[":body"] = $("#pageContent").val();

		saveNewPage(pageData);

		return false;
	});

	function saveNewPage(pageData) {
		$.ajax ({
			url: "php/save_page_content.php",
			type: "post",
			dataType: "json",
			data: {
				"page_data": pageData
			},
			success: function(data) {
				saveMenu();
				console.log("saveNewPage success: ", data);
			},
			error: function(data) {
				console.log("saveNewPage error: ", data);
			}
		});
	}

		// ToDo - if new menu link save all else just save page & path???
	function saveMenu() {
		var menuLinkData = {};
		menuLinkData[":m_title"] = $("#menuTitle").val();
		menuLinkData[":placement"] = $("#menuPlacement").val();

		$.ajax ({
			url: "php/save_page_content.php",
			type: "post",
			dataType: "json",
			data: {
				"menu_link_data": menuLinkData
			},
			success: function(data) {
				console.log("saveMenu success: ", data);
			},
			error: function(data) {
				console.log("saveMenu error: ", data);
			}
		});
	}

		function getMenus(menuData) {
		$.ajax ({
			url: "php/get_menu_content.php",
			type: "get",
			dataType: "json",
			data: {
				"menuData": menuData
			},
			success: printMenuList,
			error: function(data) {
				console.log("getmenus error: ", data);
			}
		});
	}

	function printMenuList(data) {
		console.log("printMenus success: ", data);
		// Get menu links data from DB and append to dropdown
		for (var i = 0; i < data.length; i++) {
			var menuLinkList = $("#menuChoice");
			// Add menu link list to form
			menuLinkList.append("<option>"+data[i]["title"]+"</option>");
		}
	}



	// Call needed function
	getMenus();
	getPages();


});