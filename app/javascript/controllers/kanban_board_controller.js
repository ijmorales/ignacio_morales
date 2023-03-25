import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  dragStart(event) {
    event.target.style.opacity = "0.4"
    this.dragSrcEl = event.target

    event.dataTransfer.effectAllowed = "move"
    event.dataTransfer.setData("text/html", event.target.innerHTML)
  }

  dragEnd(event) {
    event.target.style.opacity = 1
  }

  dragOver(event) {
    if (event.preventDefault) {
      event.preventDefault()
    }

    return false
  }

  drop(event) {
    event.stopPropagation()
    const cardId = this.dragSrcEl.id.split("_").pop()

    fetch(`/experiments/kanban_board/cards/${cardId}`, {
      method: "PATCH",
      credentials: "same-origin",
      headers: {
        "Accept": "text/vnd.turbo-stream.html",
        "Content-Type": "application/json",
        "X-CSRF-Token": document.querySelector("meta[name='csrf-token']").content
      },
      body: JSON.stringify({
        card: {
          status: event.target.closest("[name='status-container']").id
        }
      })
    })
      .then(response => response.text())
      .then(Turbo.renderStreamMessage)
  }
}