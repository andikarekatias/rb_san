document.addEventListener("turbo:load", function() {
  $(function () {
    var mySidebar = $("#mySidebar");
    var overlayBg = $("#myOverlay");
    window.w3_open = function() {
      if (mySidebar.css("display") === 'block') {
        mySidebar.css("display", 'none');
        overlayBg.css("display", "none");
      } else {
        mySidebar.css("display", 'block');
        overlayBg.css("display", "block");
      }
    }
    window.w3_close = function() {
      mySidebar.css("display", "none");
      overlayBg.css("display", "none");
    }
    window.sanTampil =  function(elementId) {
      var x = $("#" + elementId);
      
      if (!x.hasClass("w3-show")) {
        x.addClass("w3-show");
      } else { 
        x.removeClass("w3-show");
      }
    }
  })
})
