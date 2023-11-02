document.addEventListener("DOMContentLoaded", function() {
  const dropdownButtons = document.querySelectorAll(".nav__profile--dropdown")

  dropdownButtons.forEach((dropdownButton) => {
    dropdownButton.addEventListener("click", function(event) {
      const dropdownContent = event.currentTarget.nextElementSibling

      if (dropdownContent.style.display === "block") {
        dropdownContent.style.display = "none"
      } else {
        dropdownContent.style.display = "block"
      }
    })

    document.addEventListener("click", function(event) {
      dropdownButtons.forEach((dropdownButton) => {
        const dropdownContent = dropdownButton.nextElementSibling
        if (event.target !== dropdownButton && event.target !== dropdownContent && !dropdownButton.contains(event.target)) {
          dropdownContent.style.display = "none"
        }
      })
    })
  })
})