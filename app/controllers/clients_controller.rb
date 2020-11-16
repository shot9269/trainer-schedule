class ClientsController < ApplicationController
  def index
    @clients = Client.all
  end

  def new
    @client = Client.new
  end

  def create
    @client = Client.new(client_params)
    if @client.save
      redirect_to trainer_path(current_trainer.id)
    else
      render :new
    end
  end

  def show
    @client = Client.find(params[:id])
  end


  private
  def client_params
    params.require(:client).permit(:image,:name,:age,:sex,:belonging,:weakness,:purpose,:session_day,:session_time,:remarks).merge(trainer_id: current_trainer.id)
  end

end
