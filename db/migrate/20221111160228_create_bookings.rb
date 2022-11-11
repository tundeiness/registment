class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :equipment, null: false, foreign_key: true
      t.string :status
      t.date :booking_date
      t.text :description
      t.date :pickup_date
      t.date :return_date
      t.decimal :booking_price, precision: 8, scale: 2

      t.timestamps
    end
  end
end
