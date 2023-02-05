import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";
// Import the rangePlugin from the flatpickr library
import rangePlugin from "flatpickr/dist/plugins/rangePlugin";


// Connects to data-controller="flatpickr"
export default class extends Controller {
  static targets = [ "startDate", "endDate" , "total"]

  connect() {
    flatpickr(this.startDateTarget, { minDate: "today" })
    flatpickr(this.endDateTarget, { minDate: "today" })
  }

  calculatotal() {
    this.days = ((this.dateEnd - this.dateStart) / 86_400_000) + 1
    let totalprice = this.days * this.price
    console.log(totalprice)
    if (totalprice < 0.0 || totalprice === NaN) {
      this.totalTarget.innerText = `R$ 0.00`
    }
    else{
      this.totalTarget.innerText = `R$${this.days * this.price}`
    }
  }

  dateChangeStart() {
    this.dateStart = Date.parse(this.startDateTarget.value)
    this.price = parseFloat(this.startDateTarget.dataset.value / 100)
    console.log(this.dateStart)
    this.calculatotal()
  }

  dateChangeEnd() {
    this.dateEnd = Date.parse(this.endDateTarget.value)
    console.log(this.dateEnd)
    this.calculatotal()
  }
}
