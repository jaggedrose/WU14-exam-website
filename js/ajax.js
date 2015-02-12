// 
// AJAX call functions
// 

function getPagesList(searchParam) {
	$.ajax ({
		url: "php/get_page_content.php",
		type: "get",
		dataType: "json",
		data: {
			"search_param": searchParam
		},
		success: printPagesList,
		error: function(data) {
			console.log("getPagesList error: ", data);
		}
	});
}

function getPageForEdit(chosenPage) {
	$.ajax ({
		url: "php/get_page_content.php",
		type: "get",
		dataType: "json",
		data: {
			"chosen_page": chosenPage
		},
		success: printPageForEdit,
		error: function(data) {
			console.log("getPageForEdit error: ", data);
		}
	});
}

function updatePage(updateData) {
	$.ajax ({
		url: "php/save_page_content.php",
		type: "post",
		dataType: "json",
		data: {
			"update_data": updateData
		},
		success: function(data) {
			// saveMenu();
			console.log("updatePage success: ", data);
		},
		error: function(data) {
			console.log("updatePage error: ", data);
		}
	});
}

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
		success: makeMenuListSelect,
		error: function(data) {
			console.log("getmenus error: ", data);
		}
	});
}





// function getPages(search_param) {
// 	$.ajax ({
// 		url: "php/get_page_content.php",
// 		type: "get",
// 		dataType: "json",
// 		data: {
// 			"search_param": search_param
// 		},
// 		success: printPages,
// 		error: function(data) {
// 			console.log("getPages error: ", data);
// 		}
// 	});
// }