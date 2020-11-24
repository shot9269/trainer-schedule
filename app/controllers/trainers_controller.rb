class TrainersController < ApplicationController 
  before_action :authenticate_trainer!
  def index
  end

  def show
    @client = Client.where(trainer_id: current_trainer.id)
  end
  
end
