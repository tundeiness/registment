class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :equipment
  after_save :update_equipment_status

  validates :status, :booking_date, :description, :pickup_date, :return_date, :booking_price, presence: true

  # enum status: %i[available reserved checkedOut returned]
  # after_initialize :set_status, if: :new_record

  # def set_status
    # self.status ||= :available if status.nil?
    # self.set_status ||= :available if status.nil?
  # end

  # delegate :service_date, to: :equipment
  private

  def update_equipment_status
    equipment.update(loan_status: status)
  end
end
