class TrainersController < ApplicationController 
  before_action :authenticate_trainer!
  def show
    @client = Client.where(trainer_id: current_trainer.id)
  end
  
end
