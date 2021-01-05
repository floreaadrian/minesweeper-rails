class CreateMinesweeperBombs < ActiveRecord::Migration[6.1]
  def change
    create_table :minesweeper_bombs do |t|
      t.integer :x_position
      t.integer :y_position
      t.references :minesweeper_board, null: false, foreign_key: true

      t.timestamps
    end
  end
end
