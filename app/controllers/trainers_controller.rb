class TrainersController < ApplicationController 
  def index
  end

  def show
    @clients = Client.where(trainer_id: current_trainer.id)
  end
  
end
