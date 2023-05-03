class Equipment < ApplicationRecord
  # around_save :update_service, :update_service_date
  has_many :bookings
  has_many :users, through: :bookings
  has_many :equipment_conditions, dependent: :destroy

  before_save :update_service
  # after_commit :update_condition_count, if: -> { saved_change_to_condition? }
  after_commit :update_condition_count, on: [:create, :update], if: :condition_changed?
  SERVICE_DAYS = 30.days

  has_one_attached :featured_image

  validates :brand_name, :serial_no, :condition, :date_acquired, :supplier, :model_number, presence: true, length: { minimum: 3 }
  validates :description, presence: true, length: { in: 10..200 }
  validates :service_date, presence: true
  validates :loan_status, presence: true

  # validates :featured_image, { presence: true }

 
  scope :newest, -> { order(created_at: :asc) }


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

  # def update_condition_count
  #   # new_count = equipment_conditions.find_by(condition: condition)&.count.to_i + 1
  #   # equipment_conditions.find_by(condition: condition)&.update(count: new_count)
  #   condition_record = equipment_conditions.find_or_initialize_by(condition: condition)
  #   condition_record.update(count: condition_record.count.to_i + 1)
  # end

  def update_condition_count
    condition_record = equipment_conditions.find_or_initialize_by(condition: condition)
    condition_record.increment!(:count)
  end

end
