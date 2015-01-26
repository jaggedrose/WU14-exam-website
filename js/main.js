$(function() {


	function getPages(search_param) {
		$.ajax ({
			url: "php/get_page_content.php",
			type: "get",
			dataType: "json",
			data: {
				"search_param": search_param
			},
			success: printPages,
			error: function(data) {
				console.log("getPages error: ", data);
			}
		});
	}

	function printPages(data) {
		console.log("printPages success: ", data);

	}

	// Call needed function
	getPages();

});