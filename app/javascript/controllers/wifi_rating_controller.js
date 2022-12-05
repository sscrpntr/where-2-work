import { Controller } from "@hotwired/stimulus"
import WifiRating from "wifi-rating.js"

export default class extends Controller {
  connect() {
    new WifiRating(this.element)
  }
}
