class PlanDetail < ApplicationRecord
  belongs_to :plan

  with_options presence: true do
    validates :subject
    validates :set
    validates :rep
    validates :plan_id

  end

end
