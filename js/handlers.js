// 
// Click Handlers
// 

function onDomReady() {

	pushPopListeners();

	
	$("#thisPage").hide();
	$("#adminForm .newMenuForm").hide();
	$("#adminForm .menuLinksList").hide();
	$("#adminForm #updateFormBtn").hide();
	$("#footerForm").hide();


	// admin button clickhandler - to show/hide admin page
	$('#adminLogin').click(function() {
		$("#myAdminPageMenu").fadeIn(300);
		$("#thisPage").hide();
	});

	// checkbox clickhandler for menu choice - to show/hide menu fields
	$('.menuForm input[type="checkbox"]').click(function() {
		if ($(this).is(":checked")) {
			$("#adminForm .newMenuForm").fadeIn(300);
			$("#adminForm .menuLinksList").fadeIn(300);
		} else {
			$("#adminForm .newMenuForm").fadeOut(300);
			$("#adminForm .menuLinksList").fadeOut(300);
		}
		// If the user clicks add page to menu, make the menu title field required
		$(".menuForm #menuTitle").attr("required", $(this).is(":checked"));
	});

	var edit = false;

	// Clickhandler for admin form - Save new page
	$("#adminForm #adminFormBtn").submit(function() {
		edit = false;
		console.log("edit: ", $(this).data("edit"));
		//$("#adminForm").submit();

		//return false;
	});

		// Clickhandler for admin form - Update page
	$("#adminForm #updateFormBtn").submit(function() {
		edit = true;
		//$("#adminForm").submit();

		// Empty the form once we're done with the information in it
		// $("#adminForm").reset();

		//return false;
	});


	$("#adminForm").submit(function() {
		if (edit) {
			var pageData = {};
			pageData[":title"] = $("#pageTitle").val();
			pageData[":body"] = $("#pageContent").val();

			saveNewPage(pageData);
		} else {
			var updateData = {};
			updateData[":title"] = $("#pageTitle").val();
			updateData[":body"] = $("#pageContent").val();
			updateData[":pid"] = $("#updateFormBtn").val();

			updatePage(updateData);
			console.log(updateData);
		}

		return false;
	});
		

	// Clickhandler for admin form - Save new page
	$("#footerForm #footerFormBtn").submit(function() {

		var footerData = {};
		footerData[":f_title"] = $("#footerTitle").val();
		footerData[":company"] = $("#footerCompanyName").val();
		footerData[":street"] = $("#footerStreet").val();
		footerData[":postalcode"] = $("#footerPostalcode").val();
		footerData[":city"] = $("#footerCity").val();
		footerData["country"] = $("#footerCountry").val();
		footerData[":email"] = $("#footerEmail").val();

		saveFooter(footerData);
		console.log(footerData);

		return false;
	});

}

