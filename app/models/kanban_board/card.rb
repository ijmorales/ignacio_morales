class KanbanBoard
  class Card < ApplicationRecord
    include Statusable

    belongs_to :kanban_board

    status states: {
      todo: "todo",
      in_progress: "in_progress",
      done: "done"
    }
  end
end