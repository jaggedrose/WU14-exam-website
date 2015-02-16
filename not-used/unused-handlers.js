// checkbox clickhandler for admin form - to show/hide menu fields
	$('.menuForm input[type="checkbox"]').click(function() {
		if ($(this).is(":checked")) {
			$(".menuChoiceBtns").fadeIn(300);
		} else {
			$('.menuForm input[type="radio"]').removeAttr("checked");
			$(".newMenuForm").fadeOut(300);
			// $(".topMenuForm").fadeOut(300);
			$(".menuChoiceBtns").fadeOut(700);
		}
	});

	// Radio clickhandler for admin form - to show/hide menu fields
	$('.menuForm input[type="radio"]').click(function() {
		if ($("#addNewMenu").is(":checked")) {
			$(".newMenuForm").show();
			$(".menuLinksList").show();
		} else {
			$(".newMenuForm").hide();
			$(".menuLinksList").hide();
		}
	});