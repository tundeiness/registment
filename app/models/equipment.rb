class Equipment < ApplicationRecord
  # around_save :update_service, :update_service_date
  has_many :bookings
  has_many :users, through: :bookings
  # has_many :equipment_conditions, dependent: :destroy

  before_save :update_service

  SERVICE_DAYS = 30.days

  has_one_attached :featured_image

  validates :brand_name, :serial_no, :condition, :date_acquired, :supplier, :model_number, presence: true, length: { minimum: 3 }
  validates :description, presence: true, length: { in: 10..200 }
  validates :service_date, presence: true
  validates :loan_status, presence: true

  # validates :featured_image, { presence: true }


  scope :newest, -> { order(created_at: :asc) }
  scope :by_condition, -> { group(:condition).count }

  def self.with_booking_count
    select('equipment.*, COUNT(bookings.id) AS booking_count')
      .joins(:bookings)
      .group('equipment.id')
  end

  # Virtual attribute for booking count
  def booking_count
    bookings.count.to_i
  end

  private

  def update_service
    self.service_date = if service_date.blank?
                          (date_acquired).to_date + SERVICE_DAYS
                        else
                          (service_date).to_date + SERVICE_DAYS
                        end
  end
end
