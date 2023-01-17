class UpdateStatusDefaultToAvailableBookings < ActiveRecord::Migration[7.0]
  def change
    change_column_default :bookings, :status, from: nil, to: 'Available'
  end
end
