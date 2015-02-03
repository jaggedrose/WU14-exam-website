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
			pageListInfo.append('<th>'+data[i]["pid"]+"</th>");
			pageListInfo.append('<th>'+data[i]["title"]+"</th>");
			pageListInfo.append('<td>'+data[i]["author"]+"</td>");
			pageListInfo.append('<td>'+data[i]["created"]+"</td>");
			// pageListInfo.append('<td>'+data[i]["updated"]+"</td>");
			$("#pageList table").append(pageListInfo);
		}
	}

	// Clickhandler for admin form
	$("#adminFormBtn").click(function() {

		var pageData = {};
		pageData[":title"] = $("#pageTitle").val();
		pageData[":body"] = $("#pageContent").val();

		var menuLinkData = {};
		menuLinkData[":m_title"] = $("#menuTitle").val();
		menuLinkData[":placement"] = $("#menuPlacement").val();
		
		saveNewPage(pageData, menuLinkData);

		return false;
	});

	function saveNewPage(pageData, menuLinkData) {
		$.ajax ({
			url: "php/save_page_content.php",
			type: "post",
			dataType: "json",
			data: {
				"page_data": pageData,
				"menu_link_data": menuLinkData
			},
			success: function(data) {
				console.log("saveNewPage success: ", data);
			},
			error: function(data) {
				console.log("saveNewPage error: ", data);
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

	// ToDo - For testing!!!
	function printMenuList(data) {
		console.log("printMenus success: ", data);
		$("#menuList table tr").not(".menuListHeader").remove();
		// Get page data from DB and append to pageList
		for (var i = 0; i < data.length; i++) {
			var menuListInfo = $("<tr/>");
			// Add page list info to page
			menuListInfo.append('<th>'+data[i]["mlid"]+"</th>");
			menuListInfo.append('<td>'+data[i]["title"]+"</td>");
			menuListInfo.append('<td>'+data[i]["placement"]+"</td>");

			$("#menuList table").append(menuListInfo);
		}
	}



	// Call needed function
	getMenus();
	getPages();


});