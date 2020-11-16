class TrainersController < ApplicationController
  def index
  end
  
  def show
    @trainer = Trainer.find(params[:id])
    @clients = Client.includes(:trainer)
  end
end
