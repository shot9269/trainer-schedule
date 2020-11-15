class TrainersController < ApplicationController
  def index
  end
  def show
    @trainer = Trainer.find(params[:id])
  end
end
