import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="counter"
export default class extends Controller {
  static targets = ["output"];

  connect() {
    console.log("hello stimulus", this.element);
    console.log(this.outputTarget);
    this.count = 0;
  }

  increment(){
    console.log("Clicked!");
    this.count++;
    this.outputTarget.textContent = `You've clicked ${this.count} times!`
  }
}
