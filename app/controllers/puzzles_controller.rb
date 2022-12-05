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
    @puzzle.update(puzzle_params)
    redirect_to "/puzzles/#{@puzzle.id}"
  end 

  def destroy
    puzzle = Puzzle.find(params[:id])
    puzzle.destroy
    redirect_to "/puzzles"
  end 

  private 
  def puzzle_params
    params.permit(:name, :pieces_count, :put_together)
  end 
end  