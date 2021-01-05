class MinesweeperBoardsController < ApplicationController
  def index
    @boards = MinesweeperBoard.paginate(page: params[:page])
  end

  def show
    @minesweeper_board = MinesweeperBoard.find(params[:id])
  end

  def create
    @minesweeper_board = MinesweeperBoard.new(minesweeper_board_params)
    if @minesweeper_board.generate
      redirect_to minesweeper_board_path(@minesweeper_board)
    else
      render 'static_pages/home'
    end
  end

  def new
  end
  
  private def minesweeper_board_params
    params.require(:minesweeper_board).permit(:email, :name, :width, :height, :number_of_bombs)
  end
end
