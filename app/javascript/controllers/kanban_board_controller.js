import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  dragStart(event) {
    event.target.style.opacity = "0.4"
    this.dragSrcEl = event.target

    event.dataTransfer.effectAllowed = "move"
    event.dataTransfer.setData("text/html", event.target.innerHTML)
  }

  dragEnd(event) {
    return
  }

  dragEnter(event) {
    if (event.preventDefault) {
      event.preventDefault()
    }

    return false
  }

  dragOver(event) {
    if (event.preventDefault) {
      event.preventDefault()
    }

    return false
  }

  dragLeave(e) {
    return
  }

  drop(event) {
    event.stopPropagation()
    console.log("drop", event.target.closest("[name='status-container']"))

    fetch(`/experiments/kanban_board/cards/${this.dragSrcEl.id}`, {
      method: "PATCH",
      credentials: "same-origin",
      headers: {
        "Accept": "text/vnd.turbo-stream.html",
        "Content-Type": "application/json",
        "X-CSRF-Token": document.querySelector("meta[name='csrf-token']").content
      },
      body: JSON.stringify({
        card_id: this.dragSrcEl.dataset.cardId,
        card: {
          status: event.target.closest("[name='status-container']").id
        }
      })
    })
      .then(response => response.text())
      .then(Turbo.renderStreamMessage)
  }
}