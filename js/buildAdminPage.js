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
		var menuLinkList = $("#menuChoice");
		// Add menu link list to form
		menuLinkList.append("<option>"+data[i]["title"]+"</option>");
	}
}

// 
// Click Handlers on Admin pageListInfo
// 

// Click handler for admin form Save new page
$("#adminFormBtn").click(function() {

	var pageData = {};
	pageData[":title"] = $("#pageTitle").val();
	pageData[":body"] = $("#pageContent").val();

	saveNewPage(pageData);

	return false;
});

	
// Click handler for admin form Update page
$("#updateFormBtn").click(function() {

	var updateData = {};
	updateData[":title"] = $("#pageTitle").val();
	updateData[":body"] = $("#pageContent").val();
	updateData[":pid"] = $("#updateFormBtn").val();

	console.log(updateData);
	updatePage(updateData);

	return false;
});

