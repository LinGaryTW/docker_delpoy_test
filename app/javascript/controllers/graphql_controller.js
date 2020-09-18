import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "output" ]

  connect() {
    this.outputTarget.textContent = 'Hello, graphql!'
    console.log(JSON.stringify({ query: '{ allLinks { id description } }' }));
  }

  allLinks () {
    const token = document.querySelector('meta[name="csrf-token"]').content
    fetch('http://localhost:3000/graphql' , {
      method: 'POST',
      headers: { 
        'Content-Type': 'application/json',
        'X-CSRF-Token': token
       },
      body: JSON.stringify({ query: '{ allLinks { id description } }' }),
    })
      .then(res => res.json())
      .then(res => console.log(res.data));
  }
}