import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="file-upload"
export default class extends Controller {
  static targets = ['originalButton', 'customButton']
  connect() {
    this.originalButtonTarget.addEventListener('click', (event) => {
      console.log('haha');
    });
    this.customButtonTarget.addEventListener('click', (event) => {
      event.preventDefault()
    })
  }

   customUpload(event) {
    event.preventDefault()
    this.originalButtonTarget.click()
  }


}
