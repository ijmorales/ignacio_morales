class CreateKanbanBoardCards < ActiveRecord::Migration[7.0]
  def change
    create_table :kanban_board_cards do |t|
      t.string :title
      t.text :description, null: true
      t.string :status, null: false, default: "todo", index: true
      t.references :kanban_board, null: false, foreign_key: true

      t.timestamps
    end
  end
end
