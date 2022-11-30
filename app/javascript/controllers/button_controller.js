import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['buttonMap', 'buttonList', 'listDiv', 'mapDiv']
  connect() {
  }

  switchButtonMap(event) {
    this.listDivTarget.style.display = "none";
    event.target.classList.add("button-clicked")
    this.buttonListTarget.classList.remove("button-clicked")
    this.mapDivTarget.style.display = "block";
  }

  switchButtonList(event) {
    event.target.classList.add("button-clicked")
    this.buttonMapTarget.classList.remove("button-clicked")
    this.listDivTarget.style.display = "block";
    this.mapDivTarget.style.display = "none";
  }

}
