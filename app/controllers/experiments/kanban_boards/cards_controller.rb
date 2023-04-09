module Experiments
  module KanbanBoards
    class CardsController < ApplicationController
      before_action :set_card
      def update
        @card.update(card_params)

        respond_to do |format|
          format.turbo_stream
        end
      end

      private

      def card_params
        params.require(:card).permit(:status)
      end

      def set_card
        @card = KanbanBoard::Card.find_by(id: params[:id])

        respond_with_not_found unless @card
      end
    end
  end
end