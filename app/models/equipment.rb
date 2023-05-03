class Equipment < ApplicationRecord
  # around_save :update_service, :update_service_date
  before_save :update_service
  after_commit :update_condition_count, if: -> { saved_change_to_condition? }
  SERVICE_DAYS = 30.days

  has_one_attached :featured_image

  validates :brand_name, :serial_no, :condition, :date_acquired, :supplier, :model_number, presence: true, length: { minimum: 3 }
  validates :description, presence: true, length: { in: 10..200 }
  validates :service_date, presence: true
  validates :loan_status, presence: true

  # validates :featured_image, { presence: true }

  has_many :bookings
  has_many :users, through: :bookings
  has_many :equipment_conditions, dependent: :destroy

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
  #   new_count = equipment_conditions.find_by(condition: condition)&.count.to_i + 1
  #   equipment_conditions.find_by(condition: condition)&.update(count: new_count)
  # end
  def update_condition_count
    Equipment.transaction do
      old_condition_count = equipment_conditions.find_by(name: condition_was)&.count.to_i
      new_condition = equipment_conditions.find_or_initialize_by(name: condition)
      if new_condition.persisted?
        new_condition.increment!(:count)
      elsif old_condition_count.positive?
        equipment_conditions.create(name: condition, count: 1)
        old_condition_count -= 1
      end
      if old_condition_count > 0
        equipment_conditions.find_by(name: condition_was).decrement!(:count, old_condition_count)
      end
    end
  end
end
