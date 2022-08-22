import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "template", "form", "addedField" ]

  initialize() {
    this.index = 0;
    this.add();
  }
  
  add() {    
    let newField = this.templateTarget.innerHTML.replace(/INDEX/g, this.index);
    if (this.hasAddedFieldTarget) {
      this.addedFieldTargets.at(-1).insertAdjacentHTML("afterend", newField);
    } else {
      this.templateTarget.insertAdjacentHTML("afterend", newField);
    }

    this.index++
  }

  delete() {
    if (this.addedFieldTargets.length > 1) {
      this.addedFieldTargets.at(-1).remove()
      this.index--
    }
  }
}