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
      this.addedFieldTarget.insertAdjacentHTML("afterend", newField);
    } else {
      this.templateTarget.insertAdjacentHTML("afterend", newField);
    }

    this.index++

    // Make sure passenger can be added to db, and that user can remove passengers without messing up indices.
  }

  delete() {
    if (this.addedFieldTargets.length > 1) {
      this.addedFieldTarget.remove()
    }
  }
}