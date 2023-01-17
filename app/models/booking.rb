class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :equipment

  validates :status, :booking_date, :description, :pickup_date, :return_date, :booking_price, presence: true

  enum status: %i[available reserved checkedOut returned]
  # after_initialize :set_status, if: :new_record

  def set_status
    self.status ||= :available if status.nil?
    # self.set_status ||= :available if status.nil?
  end

  # delegate :service_date, to: :equipment
end
