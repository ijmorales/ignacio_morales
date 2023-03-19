class KanbanBoard
  class Card < ApplicationRecord
    belongs_to :kanban_board

    enum status: {
      todo: "todo",
      in_progress: "in_progress",
      done: "done"
    }
  end
end