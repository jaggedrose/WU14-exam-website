// 
// JS to build pages

function printPagesList(data) {
	console.log("printPagesList success: ", data);
	$("#pageList table tr").not(".pageListHeader").remove();
	// Get page data from DB and append to pageList
	for (var i = 0; i < data.length; i++) {
		var pageListInfo = $("<tr/>");
		// Add page list info to page
		pageListInfo.append('<th>'+data[i]["pid"]+'</th>');
		pageListInfo.append('<th>'+data[i]["title"]+'</th>');
		pageListInfo.append('<td>'+data[i]["author"]+'</td>');
		pageListInfo.append('<td>'+data[i]["created"]+'</td>');
		pageListInfo.append('<td><button class="editPage btn btn-info btn-sm" value="'+data[i]["pid"]+'"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span></button> <button class="viewPage btn btn-warning btn-sm" value="'+data[i]["pid"]+'"><span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span></button></td>');
		$("#pageList table").append(pageListInfo);
	}

	$(".editPage").click(function() {
		getPageForEdit($(this).val());
		$("#myAdminPageMenu").show();
      $("#adminForm").fadeIn(200);
      $("#pageList").hide();
		$("#updateFormBtn").show();
		$("#adminFormBtn").hide();

	});
}

function printPageForEdit(data) {
	console.log("printPageForEdit success: ", data);
	
	$("#pageTitle").val(data[0]["title"]);
	$("#pageContent").val(data[0]["body"]);
	$("#updateFormBtn").prop('value', data[0]["pid"]);
}


// 
// JS to build menus
// 

function makeMenuTree(menuData) {
	var menuTree = [];
	menuData.sort(function(x,y) {
		return x["placement"] > y["placement"];
	});

	for (var i = 0; i < menuData.length; i++) {
		var menuItem = menuData[i];
		if (menuItem["plid"] === null) {
			menuItem.subItems = [];
			menuTree.push(menuItem);
		}
	}

	for (var j = 0; j < menuTree.length; j++) {
		var topItem = menuTree[j];
		for (var k = 0; k < menuData.length; k++) {
			var subItem = menuData[k];
			if (topItem["mlid"] === subItem["plid"]) {
				subItem.subItems = [];
				topItem.subItems.push(subItem);
			}
		}
	}

	return menuTree;
}

// Make the admin form menu <select> 
function makeMenuListSelect(menuData) {
	// console.log("makeMenuListSelect success: ", menuData);

	var menuTree = makeMenuTree(menuData);
	console.log("menuTree: ", menuTree);


	
}

// Print the admin form menu <options> in the <select>
function printMenuListOptions(data) {
	// console.log("printMenuListOptions success: ", data);
	// Get menu links data from DB and append to dropdown
	for (var i = 0; i < data.length; i++) {
		var menuLinkList = $("#menuLinkSelect");
		// Add menu link list to form
		menuLinkList.append("<option>"+data[i]["title"]+"</option>");
	}
}
