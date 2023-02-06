import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";

// Connects to data-controller="flatpickr"
export default class extends Controller {
  static targets = [ "startDate", "endDate" , "total"]

  connect() {
    flatpickr(this.startDateTarget, { minDate: "today" })
    flatpickr(this.endDateTarget, { minDate: "today" })
    this.dateStart = Date.parse(this.startDateTarget.value)
    this.dateEnd = Date.parse(this.endDateTarget.value)
  }

  calculaTotal() {
    this.price = parseFloat(this.startDateTarget.dataset.value / 100)
    this.days = ((this.dateEnd - this.dateStart) / 86_400_000) + 1
    let totalprice = this.days * this.price
    if (totalprice < 0.0 || isNaN(totalprice)) {
      this.totalTarget.innerText = `Total do aluguél: R$ 0,00`
    }
    else{
      this.totalTarget.innerText = `Total do aluguél: R$${this.days * this.price}`
    }
  }

  dateChangeStart() {
    this.dateStart = Date.parse(this.startDateTarget.value)
    this.calculaTotal()
  }

  dateChangeEnd() {
    this.dateEnd = Date.parse(this.endDateTarget.value)
    this.calculaTotal()
  }

}
