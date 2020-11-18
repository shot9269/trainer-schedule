class Plan < ApplicationRecord
  belongs_to :client
  has_many :plan_details 
  with_options presence: true do
    validates :title
    validates :description
    validates :client_id
  end
end
