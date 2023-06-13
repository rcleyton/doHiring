document.addEventListener("DOMContentLoaded", function() {
  var closeButtons = document.querySelectorAll(".close-btn");
  
  closeButtons.forEach(function(button) {
    button.addEventListener("click", function() {
      var alert = this.closest(".alert");
      alert.style.display = "none";
    });
  });
});
