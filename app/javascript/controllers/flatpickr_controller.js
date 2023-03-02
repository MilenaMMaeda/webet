import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";


// Connects to data-controller="flatpickr"
export default class extends Controller {
  static targets = [ "startTime", "endTime" ]
  connect() {
    // flatpickr(this.startTimeTarget, {})
    // flatpickr(this.endTimeTarget, {})
    flatpickr(this.startTimeTarget, {
      minDate: "today",
      dateFormat: "d.m.Y",
      altInput: true,
    });
    flatpickr(this.endTimeTarget, {
      dateFormat: "d.m.Y",
      altInput: true,
    });
  }
}
