class Equipment < ApplicationRecord
  # around_save :update_service, :update_service_date
  before_save :update_service
  # before_create :update_service
  SERVICE_DAYS = 30
  # after_commit :update_service, :update_service_date

  # belongs_to :user
  has_one_attached :photo do |photo|
    photo.variant :thumbnail, resize_to_limit: [100, 100]
    photo.variant :medium, resize_to_limit: [400, 400]
  end
  validates :brand_name, :serial_no, :condition, :date_acquired, :supplier, :model_number, presence: true, length: { minimum: 3 }
  validates :description, presence: true, length: { in: 10..200 }
  validates :service_date, presence: true
  validates :loan_status, presence: true

  has_many :bookings
  has_many :users, through: :bookings

  scope :newest, -> { order(created_at: :asc) }
  # scope :oldest, -> { order(created_at: :desc) }
  def update_service
    if service_date.nil?
      self.service_date = date_acquired + SERVICE_DAYS
    else
      self.service_date += SERVICE_DAYS
    end
  end

  # def update_service_date
  #   ActiveRecord::Base.transaction do
  #     user.update_column(created_at: :date_acquired)
  #   end
  # end
end
