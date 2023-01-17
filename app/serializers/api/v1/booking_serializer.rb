class BookingSerializer < ActiveModel::Serializer
  attributes :id, :status, :booking_date, :description, :pickup_date, :return_date, :booking_price, :user_id, :equipment_id
end
