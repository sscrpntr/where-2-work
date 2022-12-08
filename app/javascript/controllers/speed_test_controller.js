import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="speed-test"
export default class extends Controller {
  static targets = ["wifiDown", "wifiUp", "progress", "wifiInputs"]

  runTest() {
    console.log("testrunnng")
    fetch("/reviews/test_speed", {
      headers: { "Accept": "application/json" }
    })
      .then(response => response.json())
      .then((data) => {
        console.log(data.wifi_down)
        this.wifiDownTarget.value = data.wifi_down
        this.wifiUpTarget.value = data.wifi_up
        this.progressTarget.style.display = "none";
        this.wifiInputsTarget.style.display = "block";
      })
  }
}
