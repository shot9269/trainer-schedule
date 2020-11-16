class PlansController < ApplicationController
  def index
    @plans = Plan.all
  end

  def new
    @client = Client.find(params[:client_id])
    @plan =Plan.new
  end

  def create
    @plan = Plan.new(plan_params)
    if @plan.save
      redirect_to clients_path
    else
      @client = Client.find(params[:client_id])
      render :new
    end
  end

  private
  def plan_params
    params.require(:plan).permit(:title,:description,:caution).merge(client_id: params[:client_id])
  end

end
