import { Controller } from "@hotwired/stimulus";
import flatpickr from "flatpickr";
require("flatpickr/dist/themes/airbnb.css");
export default class extends Controller {
  connect() {
    console.log("hi");
    new flatpickr(this.element, {
      enableTime: false,
      minDate: "today",
      allowInput: false,
      enableTime: false,
      firstDayOfWeek: 1
    });
  }
}
