import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    setTimeout(() => {
      this.element.remove();
    }, 5000); // Remover após 5 segundos
  }

  close() {
    this.element.remove();
  }
}
