import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["togglableElement"]

  connect() {
    console.log("Hello from toggle_controller.js")
  }

  fire() {
    this.togglableElementTarget.classList.toggle("d-none");
  }

  submit() {
    // You can add logic here to hide the form after submission if needed
    this.togglableElementTarget.classList.add("d-none");
  }
}
