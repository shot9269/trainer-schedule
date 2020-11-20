class Client < ApplicationRecord
  belongs_to :trainer
  has_many :plans
  has_one_attached :image
  
  with_options presence: true do
    validates :name
    validates :age
    validates :sex
    validates :purpose
    validates :belonging
    validates :start_time
    validates :session_time
    validates :trainer_id
  end

end
