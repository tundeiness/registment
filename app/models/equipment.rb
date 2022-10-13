class Equipment < ApplicationRecord
  before_save :update_service
  # belongs_to :user
  has_one_attached :photo do |photo|
    photo.variant :thumbnail, resize_to_limit: [100, 100]
    photo.variant :medium, resize_to_limit: [400, 400]
  end
  validates :brand_name, :serial_no, :condition, :date_acquired, :supplier, :model_number, presence: true, length: { minimum: 3 }
  validates :description, presence: true, length: { in: 10..200 }

  scope :newest, -> { order(created_at: :asc) }
  # scope :oldest, -> { order(created_at: :desc) }
  def update_service
    if self.service_date.zero?
      self.service_date = self.date_acquired + 30.days
    else
      self.service_date += 30.days
    end
  end
end
