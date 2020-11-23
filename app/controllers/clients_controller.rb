class ClientsController < ApplicationController
  before_action :authenticate_trainer!
  # before_action :authorized_trainer, only: [:show,:edit,:update]
  before_action :client_id, only: [:show,:edit,:update,:session_update]

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
  end

  def edit
  end


  def update
    if @client.update(client_params)
      redirect_to clients_path
    else
      render :edit
    end
  end

  def session_update
  end



  private
  def client_id
    @client = Client.find(params[:id])
  end

  def client_params
    params.require(:client).permit(:image,:name,:age,:sex,:belonging,:weakness,:purpose,:start_time,:session_time,:remarks).merge(trainer_id: current_trainer.id)
  end

  def authorized_trainer
    @client = Client.find(params[:id])
    if current_trainer.id != @client.trainer_id
      redirect_to new_trainer_session_path
    end
  end
end
