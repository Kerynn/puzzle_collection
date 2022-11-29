class PuzzlesController < ApplicationController
  def index 
    @puzzles = Puzzle.all 
  end 

  def show
  end 
end 