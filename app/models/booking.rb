class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :equipment
  after_save :update_equipment_status

  validates :status, :booking_date, :description, :pickup_date, :return_date, :booking_price, presence: true

  # enum status: %i[available reserved checkedOut returned]

  private

  def update_equipment_status
    equipment.update(loan_status: status)
  end
end
