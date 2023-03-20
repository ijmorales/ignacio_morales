module Experiments
  class KanbanBoardsController < ApplicationController
    def show
      @kanban_board = KanbanBoard.includes(:cards).last
    end
  end
end
