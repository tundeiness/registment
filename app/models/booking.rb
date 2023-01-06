class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :equipment

  validates :status, presence: true
  validates :booking_date, presence: true
  validates :description, presence: true
  validates :pickup_date, presence: true
  validates :return_date, presence: true
  validates :booking_price, presence: true


  enum status: %i[available reserved checkoedOut returned]
  after_initialize :set_status, if: :new_record

  def set_status
    self.status ||= :available if status.nil?
    # self.set_status ||= :available if status.nil?
  end

  # delegate :service_date, to: :equipment
end
