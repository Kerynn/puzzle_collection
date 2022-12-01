class CollectorPuzzlesController < ApplicationController
  def index
    collector = ::Collector.find(params[:collector_id])
    @puzzles = collector.puzzles
  end 
end 