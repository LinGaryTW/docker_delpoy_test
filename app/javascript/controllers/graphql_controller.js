import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "output" ]

  connect() {
    console.log(this);
    this.outputTarget.textContent = 'Hello, graphql!'
  }

  allLinks () {
    fetch('http://127.0.0.1:3000/graphql', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ query: '{ allLinks { id } }' }),
    })
      .then(res => res.json())
      .then(res => console.log(res.data));
  }
}