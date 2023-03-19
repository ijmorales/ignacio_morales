module Experiments
  class KanbanBoardsController < ApplicationController
    def show
      @kanban_board = KanbanBoard.last
    end
  end
end
