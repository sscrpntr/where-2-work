import { Controller } from "@hotwired/stimulus"
let scrollHeight = 0
export default class extends Controller {
  static targets = ["remove", "add"]
  static values = {venueId: String, favoriteId: String}

  connect (){

  }
  refresh (event) {


    event.preventDefault()
    const url = `/venues/${this.venueIdValue}/favorite_venues/${this.favoriteIdValue}`
    fetch(url, {
      method: "DELETE",
      headers: {
          "Accept": "application/json",
          "X-CSRF-Token": document.head.querySelector("[name='csrf-token']").content
        }
      })
      .then(response => response.json())
      .then((data) => {
        this.element.innerHTML= `<a data-turbo-method="post" href="/venues/${this.venueIdValue}/favorite_venues"><i class="fa-regular fa-heart fav-icon" data-action="click->favorite#drefresh"></i></a>`
      })

  }

  drefresh (event) {


    event.preventDefault()
    const url = `/venues/${this.venueIdValue}/favorite_venues`
    fetch(url, {
      method: "POST",
      headers: {
          "Accept": "application/json",
          "X-CSRF-Token": document.head.querySelector("[name='csrf-token']").content
        }
      })
      .then(response => response.json())
      .then((data) => {
        this.element.innerHTML= `<a data-turbo-method="delete" href="/venues/${this.venueIdValue}/favorite_venues"><i class="fa-solid fa-heart fav-icon" data-action="click->favorite#refresh"></i></a>`
      })

  }

}
