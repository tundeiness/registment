class Equipment < ApplicationRecord
  # around_save :update_service, :update_service_date
  before_save :update_service
  SERVICE_DAYS = 30.days

  has_one_attached :featured_image

  validates :brand_name, :serial_no, :condition, :date_acquired, :supplier, :model_number, presence: true, length: { minimum: 3 }
  validates :description, presence: true, length: { in: 10..200 }
  validates :service_date, presence: true
  validates :loan_status, presence: true

  # validates :featured_image, { presence: true }

  has_many :bookings
  has_many :users, through: :bookings

  scope :newest, -> { order(created_at: :asc) }

  private

  def update_service
    self.service_date = if service_date.blank?
                          (date_acquired).to_date + SERVICE_DAYS
                        else
                          (service_date).to_date + SERVICE_DAYS
                        end
  end
end
