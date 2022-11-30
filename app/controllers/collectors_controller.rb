class CollectorsController < ApplicationController 
  def index 
   @collectors = ::Collector.all
  end 

  def show 
    @collector = ::Collector.find(params[:id])
  end 
end 
