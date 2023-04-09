module KanbanBoardsHelper
  def cards_by_status(kanban_board)
    kanban_board.cards.group_by(&:status)
  end
end
