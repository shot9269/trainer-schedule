class ClientsController < ApplicationController
  def index
    @clients = Client.where(trainer_id: current_trainer.id)
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

  def edit
    @client= Client.find(params[:id])
  end


  def update
    @client= Client.find(params[:id])
    if @client.update(client_params)
      redirect_to clients_path
    else
      render :edit
    end
  end



  private
  def client_params
    params.require(:client).permit(:image,:name,:age,:sex,:belonging,:weakness,:purpose,:start_time,:session_time,:remarks).merge(trainer_id: current_trainer.id)
  end

end
