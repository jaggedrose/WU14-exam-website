$(function() {


	function getPages(search_param) {
		$.ajax ({
			url: "php/get_page_content.php",
			type: "get",
			dataType: "json",
			data: {
				"search_param": search_param
			},
			success: printPagesList,
			error: function(data) {
				console.log("getPages error: ", data);
			}
		});
	}

	function printPagesList(data) {
		console.log("printPages success: ", data);
		$("#pageList table tr").not(".pageListHeader").remove();
		// Get page data from DB and append to pageList
		for (var i = 0; i < data.length; i++) {
			var pageListInfo = $("<tr/>");
			// Add page list info to page
			pageListInfo.append('<td><span class="badge">'+data[i]["pid"]+"</span></td>");
			pageListInfo.append('<td>'+data[i]["title"]+"</td>");
			pageListInfo.append('<td>'+data[i]["author"]+"</td>");
			pageListInfo.append('<td>'+data[i]["created"]+"</td>");
			pageListInfo.append('<td>'+data[i]["updated"]+"</td>");
			$("#pageList table").append(pageListInfo);
		}
	}

	// Call needed function
	getPages();

});