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

ActiveRecord::Schema.define(version: 2021_01_05_085924) do

  create_table "minesweeper_boards", force: :cascade do |t|
    t.string "email"
    t.string "name"
    t.integer "number_of_bombs"
    t.integer "width"
    t.integer "height"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "minesweeper_bombs", force: :cascade do |t|
    t.integer "x_position"
    t.integer "y_position"
    t.integer "minesweeper_board_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["minesweeper_board_id"], name: "index_minesweeper_bombs_on_minesweeper_board_id"
  end

  add_foreign_key "minesweeper_bombs", "minesweeper_boards"
end
