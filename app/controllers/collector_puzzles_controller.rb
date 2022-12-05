class CollectorPuzzlesController < ApplicationController
  def index
    @collector = ::Collector.find(params[:collector_id])
    if params[:sorted] 
      @puzzles = @collector.sort_alpha
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