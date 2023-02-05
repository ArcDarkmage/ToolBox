import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";
// Import the rangePlugin from the flatpickr library
import rangePlugin from "flatpickr/dist/plugins/rangePlugin";


// Connects to data-controller="flatpickr"
export default class extends Controller {
  static targets = [ "startDate", "endDate" , "total"]

  connect() {
    const start = flatpickr(this.startDateTarget, { minDate: "today" })
    const end = flatpickr(this.endDateTarget, { minDate: "today" })
  }



  dateChange() {
    this.totalTarget.innerText = "a definir"
  }
}
