import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ['content']

  btnActive() {
    this.contentTarget.classList.toggle('active-btn')

  }
}
