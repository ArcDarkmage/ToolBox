import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";

// Connects to data-controller="flatpickr"
export default class extends Controller {
  static targets = [ "startDate", "endDate" , "total"]

  connect() {
    const unavailableDates = this.startDateTarget.dataset.value
    console.log(this.startDateTarget.value)
    this.dateStart = Date.parse(this.startDateTarget.value)
    this.dateEnd = Date.parse(this.endDateTarget.value)
    flatpickr(this.startDateTarget, { minDate: "today",
                                      disable: JSON.parse(unavailableDates),
                                      altInput: true,
                                      altFormat: "d-m-Y",
                                      defaultDate: this.dateStart
                                    })
    flatpickr(this.endDateTarget, { minDate: "today",
                                    disable: JSON.parse(unavailableDates),
                                    altInput: true,
                                    altFormat: "d-m-Y",
                                    defaultDate: this.dateStart })
  }

  calculaTotal() {
    const price = parseFloat(this.totalTarget.dataset.value / 100)
    const days = ((this.dateEnd - this.dateStart) / 86_400_000) + 1
    let total = days * price
    if (total < 0.0 || isNaN(total)) {
      this.totalTarget.innerText = `Total do aluguél: R$ 0,00`
    }
    else{
      this.totalTarget.innerText = `Total do aluguél: R$${total}`
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
