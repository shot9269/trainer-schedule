class PlansController < ApplicationController
  before_action :authenticate_trainer!

  def index
    @plans = Plan.all
    @client = Client.find(params[:client_id])
  end

  def new
    @client = Client.find(params[:client_id])
    @plan =Plan.new
  end

  def create
    @plan = Plan.new(plan_params)
    if @plan.save
      redirect_to new_client_plan_plan_detail_path(client_id: @plan.client_id,plan_id: @plan.id)
    else
      @client = Client.find(params[:client_id])
      render :new
    end
  end

  def destroy
    plan = Plan.find(params[:id])
    plan.destroy
    redirect_to client_plans_path(client_id: params[:client_id])
  end


  private
  def plan_params
    params.require(:plan).permit(:title,:description,:caution).merge(client_id: params[:client_id])
  end

end
