module Api
  module V1
    class UserSerializer < ActiveModel::Serializer
      attributes :id, :first_name, :last_name, :email, :password, :address, :phone
      has_many :booking
      has_many :equipment

      def bookings
        object.bookings.map do |booking|
          {
            id: booking.id,
            user_id: booking.user_id,
            equipment_id: booking.equipment_id,
            status: booking.status,
            booking_date: booking.booking_date,
            description: booking.description,
            pickup_date: booking.pickup_date,
            return_date: booking.return_date,
            booking_price: booking.booking_price
          }
        end
      end

      def equipment
        object.equipment.map do |equipment|
          {
            id: equipment.id,
            brand_name: equipment.brand_name,
            serial_no: equipment.serial_no,
            condition: equipment.condition,
            date_acquired: equipment.date_acquired,
            supplier: equipment.supplier,
            model_number: equipment.model_number,
            description: equipment.description,
            service_date: equipment.service_date,
            loan_status: equipment.loan_status
          }
        end
      end
    end
  end
end
