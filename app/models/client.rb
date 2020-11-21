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
  validate  :date_not_before_today
  
  private
  def date_not_before_today
    errors.add(:start_time, "は今日以降のものを選択してください") if start_time.nil? || start_time < Date.today
  end
end
