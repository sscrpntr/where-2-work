import { Controller } from "@hotwired/stimulus";
import flatpickr from "flatpickr";

export default class extends Controller {
  connect() {
    console.log("hi");
    new flatpickr(this.element, {
      enableTime: true
    });
  }
}
