class CollectorsController < ApplicationController 
  def index 
    if params[:sort]
      @collectors = ::Collector.sort_by_puzzles
    else
      @collectors = ::Collector.sort_collector
    end
  end 

  def show 
    @collector = ::Collector.find(params[:id])
  end 

  def new 
  end 

  def create 
    collector = ::Collector.create(collector_params)
    redirect_to "/collectors"
  end 

  def edit
    @collector = ::Collector.find(params[:id])
  end 

  def update 
    @collector = ::Collector.find(params[:id])
    @collector.update(collector_params)
    redirect_to "/collectors/#{@collector.id}"
  end 

  def destroy
    collector = ::Collector.find(params[:id])
    collector.puzzles.destroy_all
    collector.destroy
    redirect_to '/collectors'
  end 

  private 
  def collector_params
    params.permit(:name, :skills_rating, :under_30_yrs)
  end 
end 
