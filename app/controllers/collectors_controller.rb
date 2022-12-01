class CollectorsController < ApplicationController 
  def index 
    @collectors = ::Collector.all.order(created_at: :desc)
  end 

  def show 
    @collector = ::Collector.find(params[:id])
  end 
end 
