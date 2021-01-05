class StaticPagesController < ApplicationController
  def home
    @minesweeper_board = MinesweeperBoard.new
    @boards = MinesweeperBoard.last(10)
  end
end
