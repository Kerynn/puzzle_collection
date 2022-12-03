class PuzzlesController < ApplicationController
  def index 
    @puzzles = Puzzle.all.where(put_together: true)
  end 

  def show
    @puzzle = Puzzle.find(params[:id])
  end 

  def edit 
    @puzzle = Puzzle.find(params[:id])
  end 

  def update 
    @puzzle = Puzzle.find(params[:id])
    @puzzle.update(
      name: params[:name],
      pieces_count: params["Pieces Count"].to_i,
      put_together: params["Put Together"])
    redirect_to "/puzzles/#{@puzzle.id}"
  end 
end  