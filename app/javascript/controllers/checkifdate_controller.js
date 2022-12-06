import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="star-rating"
export default class extends Controller {
  static targets = ["buttonlistener", "datefield"]
  connect() {
    console.log("hello!")
    this.disableButton()
  }
  disableButton() {
    if(this.datefieldTarget.value == "") {
      this.buttonlistenerTarget.disabled = true
    }
    else {
      this.buttonlistenerTarget.disabled = false
    }
  }
}
