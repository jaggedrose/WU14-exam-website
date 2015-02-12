// 
// Click Handlers
// 

function onDomReady() {

	pushPopListeners();

	// $("#adminForm .menuChoiceBtns").hide();
	$("#adminForm .newMenuForm").hide();
	$("#adminForm .menuLinksList").hide();
	$("#adminForm #updateFormBtn").hide();


	// admin button clickhandler - to show/hide admin page
	$('#adminLogin').click(function() {
		$("#myAdminPageMenu").fadeIn(300);
	});


	// // checkbox clickhandler for admin form - to show/hide menu fields
	// $('.menuForm input[type="checkbox"]').click(function() {
	// 	if ($(this).is(":checked")) {
	// 		$(".menuChoiceBtns").fadeIn(300);
	// 	} else {
	// 		$('.menuForm input[type="radio"]').removeAttr("checked");
	// 		$(".newMenuForm").fadeOut(300);
	// 		// $(".topMenuForm").fadeOut(300);
	// 		$(".menuChoiceBtns").fadeOut(700);
	// 	}
	// });

	// // Radio clickhandler for admin form - to show/hide menu fields
	// $('.menuForm input[type="radio"]').click(function() {
	// 	if ($("#addNewMenu").is(":checked")) {
	// 		$(".newMenuForm").show();
	// 		$(".menuLinksList").show();
	// 	} else {
	// 		$(".newMenuForm").hide();
	// 		$(".menuLinksList").hide();
	// 	}
	// });

	// checkbox clickhandler for menu choice - to show/hide menu fields
	$('.menuForm input[type="checkbox"]').click(function() {
		if ($(this).is(":checked")) {
			$(".newMenuForm").fadeIn(300);
			$(".menuLinksList").fadeIn(300);
		} else {
			$(".newMenuForm").fadeOut(300);
			$(".menuLinksList").fadeOut(300);
		}
	});

	
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

