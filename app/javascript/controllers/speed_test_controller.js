import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="speed-test"
export default class extends Controller {
  connect() {
    console.log("hello")
  }
}
