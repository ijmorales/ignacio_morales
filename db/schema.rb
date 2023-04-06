# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_04_06_183929) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "kanban_board_cards", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "status", default: "todo", null: false
    t.bigint "kanban_board_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "position", default: 0, null: false
    t.index ["kanban_board_id"], name: "index_kanban_board_cards_on_kanban_board_id"
    t.index ["status"], name: "index_kanban_board_cards_on_status"
  end

  create_table "kanban_boards", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "kanban_board_cards", "kanban_boards"
end
