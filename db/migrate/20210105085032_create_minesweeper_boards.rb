class CreateMinesweeperBoards < ActiveRecord::Migration[6.1]
  def change
    create_table :minesweeper_boards do |t|
      t.string :email
      t.string :name
      t.integer :number_of_bombs
      t.integer :width
      t.integer :height

      t.timestamps
    end
  end
end
