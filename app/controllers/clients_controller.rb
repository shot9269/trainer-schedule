class ClientsController < ApplicationController
  def new
    @client = Client.new
  end

  def create
    @client = Client.new(client_params)
    binding.pry
    if @client.save
      redirect_to trainer_path(current_trainer.id)
    else
      render :new
    end
  end

  private
  def client_params
    params.require(:client).permit(:image,:name,:age,:sex,:belonging,:weakness,:purpose,:session_day,:session_time,:remarks).merge(trainer_id: current_trainer.id)
  end

end
