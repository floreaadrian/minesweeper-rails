require "test_helper"

class MinesweeperBoardTest < ActiveSupport::TestCase
  def setup
    @board = MinesweeperBoard.new(name: 'boardname', email: 'email@ok.com',
                              width: 10, height: 10, number_of_bombs: 10)
  end

  test "number of bombs in generated board" do
    generatedMatrix = @board.generate
    number_of_bombs = 0
    (0..@board.height-1).each do |i|
      (0..@board.width-1).each do |j|
        number_of_bombs+=1 if generatedMatrix[i][j] == :bomb
      end
    end
    assert number_of_bombs, @board.number_of_bombs
  end

  test "number of bombs from minesweeped bombs is the same" do
    generatedMatrix = @board.generate
    number_of_minesweeper_bombs = @board.bombs.count
    assert @board.number_of_bombs, number_of_minesweeper_bombs
  end
  
  test "as_matrix returns the same array as generated" do
    generatedMatrix = @board.generate
    as_matris_return = @board.as_matrix
    assert generatedMatrix, as_matris_return
  end

end
