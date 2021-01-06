class MinesweeperBoardsController < ApplicationController
  def index
    @boards = MinesweeperBoard.paginate(page: params[:page])
  end

  def show
    @minesweeper_board = MinesweeperBoard.find(params[:id])
  end

  def create
    @minesweeper_board = MinesweeperBoard.new(minesweeper_board_params)
    respond_to do |format|
      if @minesweeper_board.generate
        format.json { render json: { 'response': "succes" } }
        format.html { redirect_to minesweeper_board_path(@minesweeper_board) }
      else
        format.json { render json: @minesweeper_board.errors, status: 500 }
        format.html { render 'static_pages/home' }
      end
    end
  end

  def new
  end
  
  private def minesweeper_board_params
    params.require(:minesweeper_board).permit(:email, :name, :width, :height, :number_of_bombs)
  end
end
