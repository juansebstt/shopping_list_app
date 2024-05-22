
import { Controller } from "stimulus"

export default class extends Controller {
  markAsPurchased(event) {
    event.preventDefault();
    this.element.form.submit();
  }
}