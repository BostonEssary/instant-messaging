import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="submit-on-input"
export default class extends Controller {
  connect() {
  }

  submitForm(event) {
    Rails.fire(this.element, 'submit')

  }
}
