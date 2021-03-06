// 
// Push/pop state
// 


// Setup push/pop-state pushPopListeners for <a> tags
function pushPopListeners() {

  // Decide what to show
  onPopAndStart();

  // When we click a link
  $(document).on("click","a",function(event){

    // If the user clicks a real http:// || https:// link,
    if ($(this).attr("href").indexOf("://") >=0) {
      // assume they are leaving the site
      return;
    }

    $("main .row").children().hide();
    
    history.pushState(null,null,$(this).attr("href"));
    showSection($(this).attr("href"));
    event.preventDefault();
  });

  // Add a pop state listener
  // (listen to forward/backward buttons in the browser)
  addEventListener("popstate",onPopAndStart);

  // Run this function on popstate and initial load
  function onPopAndStart(){
    // Read our url and extract the page name
    // the characters after the last slash
    var l = location.href;
    var pageName = l.substring(l.lastIndexOf("/")+1);
    // If no pageName set pageName to false
    pageName = pageName || false;
    console.log("pageName: ", pageName);

    $("main .row").children().hide();
    // and showSection
    showSection(pageName);
  }

  function showSection(pageName) {
    // console.log("showSection: ", pageName);

    // If no pageName was received, show first page in DB as "home"
    if (!pageName) {
      pageName = 1;
      $("#thisPage").show();
    }

    getMenus(undefined, pageName);

    // If page list is chosen, get data with Ajax
    // Elseif whichever form is chosen, get data with Ajax
    // Else get chosen page
    if (pageName == "page-list") {
      $("#myAdminPageMenu").show();
      getPagesList();
      $("#pageList").fadeIn(300);
    }
    else if (pageName == "admin-form") {
      $("#myAdminPageMenu").show();
      $("#adminForm").fadeIn(300);
    }
    else if (pageName == "footer-form") {
      $("#myAdminPageMenu").show();
      $("#footerForm").fadeIn(300);
    }
    else if (pageName == "image-form") {
      $("#myAdminPageMenu").show();
      $("#imageForm").fadeIn(300);
    }
    else {
      getChosenPage(pageName);
      pageName = "page";
       $("#thisPage").fadeIn(300);
    }
  }

}