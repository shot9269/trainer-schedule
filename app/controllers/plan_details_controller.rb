class PlanDetailsController < ApplicationController

  before_action :client_id, only:[:new,:create,:show]
  before_action :plan_id, only:[:new,:create,:show]

  def new
    @plan_detail = PlanDetail.new
  end

  def create
    @plan_detail = PlanDetail.new(plan_detail_params)
    if @plan_detail.save
      redirect_to client_plans_path(client_id: @client.id)
    else
      @plan = Plan.find(params[:plan_id])
      @client = Client.find(params[:client_id])
      render :new
    end
  end

  def show
    @plan_detail = PlanDetail.find(params[:id])
    
  end
  private
  def plan_detail_params
    params.require(:plan_detail).permit(:subject,:weight,:set,:rep,:cardio,:cardio_time).merge(plan_id: params[:plan_id])
  end

  def client_id
    @client = Client.find(params[:client_id])
  end
  def plan_id
    @plan = Plan.find(params[:plan_id])
  end

  
end
