import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['dropdownContent'];

  connect() {
    document.addEventListener("click", this.hideDropdowns.bind(this));
  }

  toggleDropdown(event) {
    const dropdownContent = this.dropdownContentTarget;

    if (dropdownContent.style.display === "block") {
      dropdownContent.style.display = "none";
    } else {
      dropdownContent.style.display = "block";
    }

    event.stopPropagation();
  }

  hideDropdowns(event) {
    if (!this.element.contains(event.target)) {
      this.dropdownContentTarget.style.display = "none";
    }
  }
}