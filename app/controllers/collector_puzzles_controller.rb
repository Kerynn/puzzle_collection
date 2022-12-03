class CollectorPuzzlesController < ApplicationController
  def index
    @collector = ::Collector.find(params[:collector_id])
    @puzzles = @collector.puzzles
  end 

  def new 
    @collector = ::Collector.find(params[:collector_id])

  end 

  def create
    @collector = ::Collector.find(params[:collector_id])
    @puzzles = @collector.puzzles.create(
      name: params[:name],
      pieces_count: params["Pieces Count"].to_i,
      put_together: params["Put Together"])
    redirect_to "/collectors/#{@collector.id}/puzzles"
  end 
end 