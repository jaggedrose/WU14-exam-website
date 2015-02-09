// 
// Push/pop state
// 


//setup push/pop-state pushPopListeners for <a> tags
function pushPopListeners() {
  // When we click a link
  $(document).on("click","a",function(event){

    //if the user clicks a real http:// || https:// link,
    if ($(this).attr("href").indexOf("://") >=0) {
      //assume they are leaving the site
      return;
    }

    // //prevent "empty" urls from affecting browsing
    // if ($(this).attr("href") && $(this).attr("href") !== "#") {
    //   goTo($(this).attr("href"));
    // }
    history.pushState(null,null,$(this).attr("href"));
    showSection($(this).attr("href"));
    event.preventDefault();
  });

  // Add a pop state listener
  // (listen to forward/backward buttons in the browser)
  addEventListener("popstate",onPopAndStart);

  //and run once immediately (this function runs at DOM ready)
  onPopAndStart();

  // Run this function on popstate and initial load
  function onPopAndStart(){
    // Read our url and extract the page name
    // the characters after the last slash
    var l = location.href;
    //might need to change this
    var pageName = l.substring(l.lastIndexOf("/")+1);

    // if no pageName set pageName to false
    pageName = pageName || false;
    console.log("pageName: ", pageName);
    //and showSection
    showSection(pageName);
  }

  function showSection(pageName) {
    console.log("showSection: ", pageName);
    $("section").hide();
    $('section#'+pageName).show();

    // $(".nav li").removeClass("active");
    //then find any links in body pointing to the pageUrl,
    $("body").find('a[href="'+pageName+'"]').each(function() {
      //and add .active to my parent if it is an li tag
      $(this).parent("li").addClass("active");
    });

    $(".navbar li a").parent("li").removeClass("active");
    // $('.navbar li a[href='+ pageName +']').parent("li").addClass("active");
  }
}