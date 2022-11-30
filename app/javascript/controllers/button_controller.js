import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['buttonMap', 'buttonList', 'listDiv']
  connect() {
    console.log("working button")

  }
  switchButtonMap(event) {
    const algo = document.querySelector(".listDiv")
    algo.style.display = "none";
    const aquello = document.querySelector(".mapDiv")
    event.target.classList.add("button-clicked")
    this.buttonListTarget.classList.remove("button-clicked")
    aquello.style.display = "block";

  }

  switchButtonList(event) {
    event.target.classList.add("button-clicked")
    const aquello = document.querySelector(".mapDiv")
    this.buttonMapTarget.classList.remove("button-clicked")
    const algo = document.querySelector(".listDiv")
    algo.style.display = "block";
    aquello.style.display = "none";
  }

}
