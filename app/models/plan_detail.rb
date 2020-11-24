class PlanDetail < ApplicationRecord
  belongs_to :plan

  with_options presence: true do
    validates :subject
    validates :set
    validates :rep
    validates :plan_id
  end

  # def self.create_plan_detail(params)
  #   plan_details = []
  #   for i in 0..1 do## リスト数 n-1
  #     plan_details << PlanDetail.new(params[i])
  #     return false if !plan_details[i].valid?
  #   end
  #   plan_details.each do |plan_detail|
  #     plan.detail.save
  #   end
  #   return true
  # end 
end
