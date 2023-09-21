import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["togglableElement", "togglableTrainerView", "togglableClientView"]

  connect() {
    console.log("Hello from toggle_controller.js")
  }

  fire() {
    const currentText = this.togglableElementTarget.textContent;
    this.togglableTrainerViewTarget.classList.toggle("d-none");
    this.togglableClientViewTarget.classList.toggle("d-none");
    if (currentText === "Upcoming sessions booked with me.") {
      this.togglableElementTarget.textContent = "Upcoming sessions booked by me.";
    } else {
      this.togglableElementTarget.textContent = "Upcoming sessions booked with me.";
    }
  }
}
