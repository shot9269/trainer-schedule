class PlanDetailsController < ApplicationController
  def new
    @plan = Plan.find(params[:plan_id])
    @plan_detail = PlanDetail.new
    @client = Client.find(params[:client_id])
  end

  def create
    @plan_detail = PlanDetail.new(plan_detail_params)
    if @plan_detail.save
      redirect_to client_plans_path(@plan_detail.plan_id)
    else
      @plan = Plan.find(params[:plan_id])
      @client = Client.find(params[:client_id])
      render :new
    end
  end
  private
  def plan_detail_params
    params.require(:plan_detail).permit(:subject,:weight,:set,:rep,:cardio,:cardio_time).merge(plan_id: params[:plan_id])
  end
  
end
