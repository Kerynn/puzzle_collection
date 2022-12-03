class CollectorsController < ApplicationController 
  def index 
    @collectors = ::Collector.all.order(created_at: :desc)
  end 

  def show 
    @collector = ::Collector.find(params[:id])
  end 

  def new 
  end 

  def create 
    collector = ::Collector.create(
      name: params[:name],
      skills_rating: params["Skills Rating"].to_i,
      under_30_yrs: params["Under 30 Years Old"])
    redirect_to "/collectors"
  end 
end 
