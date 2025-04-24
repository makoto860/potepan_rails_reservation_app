document.addEventListener("DOMContentLoaded", function() {
    var dropdownToggleLink = document.querySelector(".dropdown-toggle");
    if (dropdownToggleLink) {
      dropdownToggleLink.addEventListener("click", function(e) {
        e.preventDefault();
        var dropdownMenu = document.querySelector(".dropdown-menu");
        dropdownMenu.classList.toggle("show");
      });
    }
  });
