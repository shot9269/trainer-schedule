class Plan < ApplicationRecord
  belongs_to :client

  with_options presence: true do
    validates :title
    validates :description
    validates :client_id
  end
end
