class Equipment < ApplicationRecord
  # around_save :update_service, :update_service_date
  before_save :update_service
  # before_create :update_service

  # SERVICE_DAYS = Date.today.advance(days: 30)
  SERVICE_DAYS = 30.days
  # after_commit :update_service, :update_service_date

  # belongs_to :user
  has_one_attached :photo do |photo|
    photo.variant :thumbnail, resize_to_limit: [100, 100]
    photo.variant :medium, resize_to_limit: [400, 400]
  end
  validates :brand_name, :serial_no, :condition, :date_acquired, :supplier, :model_number, presence: true, length: { minimum: 3 }
  validates :description, presence: true, length: { in: 10..200 }
  # validates :service_date
  validates :loan_status, presence: true

  validates :photo, { presence: true }

  has_many :bookings
  has_many :users, through: :bookings

  scope :newest, -> { order(created_at: :asc) }
  # scope :oldest, -> { order(created_at: :desc) }
  def update_service
    self.service_date = if service_date.blank?
                          (date_acquired).to_date + SERVICE_DAYS
                        else
                          (service_date).to_date + SERVICE_DAYS
                        end
  end

  # def photo_url
  #   url_for(photo)
  # end


  # def update_service_date
  #   ActiveRecord::Base.transaction do
  #     user.update_column(created_at: :date_acquired)
  #   end
  # end
end
