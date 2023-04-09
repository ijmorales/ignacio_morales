class AddPositionToKanbanBoardCards < ActiveRecord::Migration[7.0]
  def change
    add_column :kanban_board_cards, :position, :integer, null: false, default: 0, index: true
  end
end
