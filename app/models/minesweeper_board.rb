class MinesweeperBoard < ApplicationRecord
  has_many :bombs, :class_name => 'MinesweeperBomb',
       :foreign_key => 'minesweeper_board_id'

  validates :name, presence: true, length: { maximum: 50 } 
  validates :height, presence: true, :numericality => { greater_than_or_equal_to: 0 }
  validates :width, presence: true, :numericality => { greater_than_or_equal_to: 0 }
  validates :number_of_bombs, presence: true, :numericality => { greater_than_or_equal_to: 0 }
  validates_numericality_of :number_of_bombs, 
       :less_than => Proc.new { |minesweeper_board| minesweeper_board.width * minesweeper_board.height } 
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX }

  def as_matrix
    minesweeper_matrix = Array.new(height) { Array.new(width) { :empty } }
    minesweeper_bombs = self.bombs
    minesweeper_bombs.each do |bomb|
      minesweeper_matrix[bomb.x_position][bomb.y_position] = :bomb
    end
    minesweeper_matrix
  end

  def generate
    return false if !self.valid?
    minesweeper_matrix = Array.new(height) { Array.new(width) { :empty } } 
    minesweeper_bombs = []
    height_indexes = *(0..height-1)
    width_indexes = *(0..width-1)
    indexes_for_bombs = height_indexes.product(width_indexes)
    indexes_for_bombs = indexes_for_bombs.shuffle!
    (0..number_of_bombs - 1).each do |i_th_bomb|
      x_position = indexes_for_bombs[i_th_bomb][0]
      y_position = indexes_for_bombs[i_th_bomb][1]
      minesweeper_matrix[x_position][y_position] = :bomb
      minwsweeper_bomb = {x_position: x_position,
                          y_position: y_position,
                          created_at: Time.now,
                          updated_at: Time.now}
      minesweeper_bombs.append(minwsweeper_bomb)
    end
    MinesweeperBoard.transaction do
      self.save!
      MinesweeperBomb.insert_all(minesweeper_bombs.map { |v| v[:minesweeper_board_id] = self.id; v })
    end
    minesweeper_matrix
  end
end
