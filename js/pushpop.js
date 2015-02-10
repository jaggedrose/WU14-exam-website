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
    $('section#'+$(this).attr("href")).show();

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
    $('section#'+pageName).show();
    // and showSection
    showSection(pageName);
  }

  function showSection(pageName) {
    console.log("showSection: ", pageName);

    // If page list is chosen, get data with Ajax
    if (pageName == "page-list") {
      // Get admin page list
      // getPages();
      $("#pageList").fadeIn(300);
    }
    
    $(".nav li").removeClass("active");
    // Find any links in body pointing to the pageUrl,
    $("body").find('a[href="'+pageName+'"]').each(function() {
      // and add .active to my parent if it is an li tag
      $(this).parent("li").addClass("active");
    });
  }


}