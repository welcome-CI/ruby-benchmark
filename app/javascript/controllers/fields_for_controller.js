import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  static targets = ['container', 'template'];

  add() {
    const newInput = this.templateTarget.content.cloneNode(true);
    const dateNow = Date.now();

    newInput.querySelector('label').htmlFor = newInput.querySelector('label').htmlFor.replace(/\d/gm, dateNow);
    newInput.querySelector('input').id = newInput.querySelector('input').id.replace(/\d/gm, dateNow);
    newInput.querySelector('input').name = newInput.querySelector('input').name.replace(/\d/gm, dateNow);

    this.containerTarget.appendChild(newInput);
  }
}
