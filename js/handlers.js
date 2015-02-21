// 
// Click Handlers & how/hides
// 

function onDomReady() {

	getFooter();

	$("#thisPage").hide();
	$("#adminForm .newMenuForm").hide();
	$("#adminForm .menuLinksList").hide();
	$("#updateForm").hide();
	$("#footerForm").hide();
	$("#imageForm").hide();

	pushPopListeners();

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

		// Clickhandler for admin form - Save new page
	$("#adminForm").submit(function() {
		var pageData = {};
			pageData[":title"] = $("#pageTitle").val();
			pageData[":body"] = $("#pageContent").val();

			saveNewPage(pageData);
			// console.log(pageData);

		return false;
	});

		// Clickhandler for admin form - Update page
	$("#updateForm").submit(function() {
		var updateData = {};
			updateData[":title"] = $("#updateTitle").val();
			updateData[":body"] = $("#updateContent").val();
			updateData[":pid"] = $("#updateFormBtn").val();

			updatePage(updateData);
			// console.log(updateData)

		return false;
	});

	// Clickhandler for footer form
	$("#footerForm").submit(function() {

		var footerData = {};
		footerData[":f_title"] = $("#footerTitle").val();
		footerData[":company"] = $("#footerCompany").val();
		footerData[":street"] = $("#footerStreet").val();
		footerData[":postalcode"] = $("#footerPostal").val();
		footerData[":city"] = $("#footerCity").val();
		footerData[":email"] = $("#footerEmail").val();

		saveFooter(footerData);
		// console.log(footerData);

		return false;
	});

	// Clickhandler for image form
	$("#imageForm").submit(function() {

		var imageData = {};
		imageData[":i_title"] = $("#imageTitle").val();
		imageData[":path"] = $("#ImageUrl").val();
		imageData[":alt"] = $("#imageAlt").val();
		imageData[":caption"] = $("#imageCaption").val();
		imageData[":page_id"] = $("#imagePid").val();
		
		saveImageInfo(imageData);
		// console.log(imageData);

		return false;
	});

}
