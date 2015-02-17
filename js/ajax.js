// 
// AJAX call functions
// 

function getChosenPage(href) {
	$.ajax ({
		url: "php/get_page_content.php",
		type: "get",
		dataType: "json",
		data: {
			"chosen_page": href
		},
		success: printChosenPage,
		error: function(data) {
			console.log("getChosenPage error: ", data);
		}
	});
}

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
			// $("#adminForm")[0].reset();
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
			console.log("saveNewPage success: ", data);
			if ($('.menuForm input[type="checkbox"]').is(":checked")) {
				saveMenu();
			} else {
				//$("#adminForm")[0].reset();
			}
		},
		error: function(data) {
			console.log("saveNewPage error: ", data);
		}
	});
}

function saveMenu() {
	var menuLinkData = {};
	menuLinkData[":m_title"] = $("#menuTitle").val();
	menuLinkData[":placement"] = $("#menuPlacement").val();
	menuLinkData[":plid"] = $("#menuLinkSelect").val();
	
	$.ajax ({
		url: "php/save_page_content.php",
		type: "post",
		dataType: "json",
		data: {
			"menu_link_data": menuLinkData
		},
		success: function(data) {
			console.log("saveMenu success: ", data);
			// $("#adminForm")[0].reset();
		},
		error: function(data) {
			console.log("saveMenu error: ", data);
		}
	});
}

function saveFooter(footerData) {
	$.ajax ({
		url: "php/save_page_content",
		type: "post",
		dataType: "json",
		data: {
			"footer_data": footerData
		},
		success:function(data) {
			console.log("saveFooter success: ", data);
		},
		error: function(data) {
			console.log("saveFooter error: ", data);
		}
	});
}

function getMenus(menuData, pageName) {
	$.ajax ({
		url: "php/get_menu_content.php",
		type: "get",
		dataType: "json",
		data: {
			"menu_data": menuData
		},
		success: function(data) {
			makeMenuListSelect(data);
			makeMainMenu(data);

			$(".nav li").removeClass("active");
			// Find any links in body pointing to the pageUrl,
			console.log("found: ",$("body").find('a[href="'+pageName+'"]').length);
			$("body").find('a[href="'+pageName+'"]').each(function() {
				// and add .active to my parent if it is an li tag
				$(this).parent("li").addClass("active");
			});
		},
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