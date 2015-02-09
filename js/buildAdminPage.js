// 
// JS to build admin pages, list & form
// 

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

function printMenuList(data) {
	console.log("printMenus success: ", data);
	// Get menu links data from DB and append to dropdown
	for (var i = 0; i < data.length; i++) {
		var menuLinkList = $("#topMenuLinks");
		// Add menu link list to form
		menuLinkList.append("<option>"+data[i]["title"]+"</option>");
	}
}


// 
// Click Handlers on Admin pageListInfo
// 

function onDomReady() {

	pushPopListeners();

	$("#adminForm .menuChoiceBtns").hide();
	$("#adminForm .newMenuForm").hide();
	$("#adminForm .topMenuForm").hide();
	$("#adminForm .subMenuForm").hide();
	$("#adminForm #updateFormBtn").hide();


	// checkbox clickhandler for admin form - to show/hide menu fields
	$('.menuForm input[type="checkbox"]').click(function() {
		if ($(this).is(":checked")) {
			$(".menuChoiceBtns").fadeIn(300);
		} else {
			$('.menuForm input[type="radio"]').removeAttr("checked");
			$(".newMenuForm").fadeOut(300);
			$(".topMenuForm").fadeOut(300);
			$(".menuChoiceBtns").fadeOut(700);
		}
	});

	// Radio clickhandler for admin form - to show/hide menu fields
	$('.menuForm input[type="radio"]').click(function() {
		if ($("#addNewMenu").is(":checked")) {
			$(".newMenuForm").show();
		} else {
			$(".newMenuForm").hide();
		}

		if ($("#existingMenu").is(":checked")) {
			$(".topMenuForm").show();
		} else {
			$(".topMenuForm").hide();
		}
		
		//whenever the user clicks add to menu, 
		//make the menu title field required
		// $(".addToMenu #menu_title").attr("required", $(this).is(":checked"));
	});

	// // checkbox clickhandler for menu choice - to show/hide menu fields
	// $('.menuForm input[type="checkbox"]').click(function() {
	// 	if ($(this).is(":checked")) {
	// 		$(".menuChoiceBtns").fadeIn(300);
	// 	} else {
	// 		$(".menuChoiceBtns").fadeOut(300);
	// 	}
	// });

	
	// Clickhandler for admin form - Save new page
	$("#adminFormBtn").click(function() {

		var pageData = {};
		pageData[":title"] = $("#pageTitle").val();
		pageData[":body"] = $("#pageContent").val();

		saveNewPage(pageData);

		// Empty the form once we're done with the information in it
		// $("#adminForm").reset();

		return false;
	});

		
	// Clickhandler for admin form - Update page
	$("#updateFormBtn").click(function() {

		var updateData = {};
		updateData[":title"] = $("#pageTitle").val();
		updateData[":body"] = $("#pageContent").val();
		updateData[":pid"] = $("#updateFormBtn").val();

		console.log(updateData);
		updatePage(updateData);

		// Empty the form once we're done with the information in it
		// $("#adminForm").reset();

		return false;
	});

}

