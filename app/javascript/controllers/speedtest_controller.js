import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="speedtest"
export default class extends Controller {
  static targets = ["source"]
  connect() {
    console.log("hello!");
    console.log(this.sourceTarget.value);
  }
  speedtestRun(event) {
    event.preventDefault();
    console.log("Test");
    // fetch post via ReviewsController#test_speed
    //Store response
  }
}
