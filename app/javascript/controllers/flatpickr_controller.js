import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";

export default class extends Controller {
  static targets = [ "rentStart", "rentEnd" ]

  connect() {
    flatpickr(this.rentStartTarget, {})
    flatpickr(this.rentEndTarget, {})
  }
}
