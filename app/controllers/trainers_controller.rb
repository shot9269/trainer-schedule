class TrainersController < ApplicationController 
  before_action :authenticate_trainer!
  def index
  end

  def show
    @clients = Client.all.includes(:trainer)
  end
  
end
