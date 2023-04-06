module Experiments
  class KanbanBoardsController < ApplicationController
    include Authorizable

    def show
      @kanban_board = KanbanBoard.includes(:cards).last
    end
  end
end
