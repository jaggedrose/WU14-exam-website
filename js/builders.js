// 
// JS to build pages

function printPagesList(data) {
	// console.log("printPagesList success: ", data);
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
	// console.log("printPageForEdit success: ", data);
	
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


// Make main menu in navbar
function makeMainMenu(menuData) {
	var menuTree = makeMenuTree(menuData);

	var mainMenuUl = $('<ul class="nav navbar-nav" id="mainMenu"/>');
	// Add home link 
	var menuHome = $('<li><a href="index.html" class="glyphicon glyphicon-home"></a></li>');
	// Prepend to navbar
	mainMenuUl.prepend(menuHome);
	// Remove old .navbar first & then replace with new html
	$("header .navbar-collapse").find("#mainMenu").remove();
	$("header .navbar-collapse").html(mainMenuUl);
	printMainMenu(mainMenuUl, menuTree);
}


function printMainMenu(mainMenuUl, menuTree) {
	console.log("printMainMenu success: ", menuTree);
	// Loop through menuTree to get top menu links
	for (var i = 0; i < menuTree.length; i++) {
		// Make a new <li>
		var menuLink;
		// var menuLink;
		if (menuTree[i].subItems.length === 0) {
			// If top menu has no sub menus, just make a link
			menuLink = $('<li><a href="'+menuTree[i]["path"]+'">'+menuTree[i]["title"]+'</a></li>');
		} else {
			//  First make the <li><a></a></li>
			menuLink = $('<li class="dropdown"><a href="'+menuTree[i]["path"]+'">'+menuTree[i]["title"]+'</a></li>');
			//  Then make then sub menu dropdown
			var newDropdown = $('<ul class="dropdown-menu"/>');
			// Add dropdown to menuLink
			menuLink.prepend(newDropdown);
			// Recall this function to append sub menus menuLinks to the dropdpwn
			printMainMenu(newDropdown, menuTree[i].subItems);
		}
		// And append to html
		mainMenuUl.append(menuLink);
	}
	return mainMenuUl;
}

// Make the admin form menu <select> 
function makeMenuListSelect(menuData) {
	var menuTree = makeMenuTree(menuData);
	
	// Make the <select> for add to menu in admin form
	var menuSelect = $('<select class="form-control" id="menuLinkSelect"/>');
	// add an empty top option to the select
	var topMenu = $('<option value="">Top Menu</option>');
	// Assume all menu links are from the same menu (menu-main-menu)
	topMenu.data("menuItem", {mlid: null, menu:"menu-main-menu"});
	menuSelect.append(topMenu);

	// And append to the admin form
	$("#adminForm .menuLinksList").html(menuSelect);
	printMenuListOptions(menuSelect, menuTree);
}


// Print the admin form menu <options> in the <select>
function printMenuListOptions(menuSelect, menuTree) {
	// console.log("printMenuListOptions success: ", menuTree);
	// Get menu links data from DB and append to dropdown
	for (var i = 0; i < menuTree.length; i++) {
		var menuLinkList = $("#menuLinkSelect");
		// Add menu link list to form
		menuLinkList.append('<option value="'+menuTree[i]["mlid"]+'">'+menuTree[i]["title"]+'</option>');
	}
}
