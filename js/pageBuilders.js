// 
// JS to build pages
// 

function printChosenPage(data) {
	console.log("printChosenPage success: ", data);
	// Empty section, just to be safe
	$("#thisPage").html("");
	// Build html for page, first the article tag
	var pageContent = $('<article class="pageContent"/>');
	// And then a headline tag for the title -
	pageContent.append("<h2>"+data[0]["title"]+"</h2>");
	// Assume all tags for body are already there
	pageContent.append(data[0]["body"]);
	// Checking if page has image
	if (data["images"].length > 0) {
		pageContent.append("<figure><img src='"+data["images"][0]["path"]+"'><figcaption>"+data["images"][0]["caption"]+"</figcaption></figure>");
	}
	// Print page content
	$("#thisPage").html(pageContent);
}


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
		pageListInfo.append('<td><button class="editPage btn btn-info btn-sm" value="'+data[i]["pid"]+'"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span></td>');
		$("#pageList table").append(pageListInfo);
	}

	// Show admin form for Update Page
	$(".editPage").click(function() {
		getPageForEdit($(this).val());
		$("#myAdminPageMenu").show();
      $("#adminForm").fadeIn(200);
      $(".menuForm").hide();
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


function printFooter(data) {
	// console.log("printFooter success: ", data);
	var footerText1 = $('<section class="navbar-text" id="footerText1"/>');
	var footerText2 = $('<section class="navbar-text" id="footerText2"/>');
	// And then append to footer
	footerText1.append("<h4><strong>"+data[0]["company"]+"</strong></h4><p>"+data[0]["street"]+"</br>"+data[0]["postalcode"]+" "+data[0]["city"]+"</p>");
	footerText2.append("<h4>"+data[0]["title"]+"</h4><p>"+data[0]["email"]+"</p>");
	// Print footer content
	$(".footerContent").after(footerText1, footerText2);
}

