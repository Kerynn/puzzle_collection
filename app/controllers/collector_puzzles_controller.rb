class CollectorPuzzlesController < ApplicationController
  def index
    @collector = ::Collector.find(params[:collector_id])
    if params[:alpha] 
      @puzzles = @collector.sort_alpha
    elsif params[:input_pieces]
      @puzzles = @collector.pieces_greater_than(params[:input_pieces])
    else
      @puzzles = @collector.puzzles
    end 
  end 

  def new 
    @collector = ::Collector.find(params[:collector_id])
  end 

  def create
    @collector = ::Collector.find(params[:collector_id])
    @puzzles = @collector.puzzles.create(puzzle_params)
    redirect_to "/collectors/#{@collector.id}/puzzles"
  end 

  private 
  def puzzle_params
    params.permit(:name, :pieces_count, :put_together)
  end 
end 