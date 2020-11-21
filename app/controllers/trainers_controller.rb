class TrainersController < ApplicationController 
  def index
  end

  def show
    @clients = Client.all.includes(:trainer)
  end
  
end
