require 'rails_helper'

RSpec.describe 'Api::V1::Bookings', type: :request do
  let(:url) { '/users/sign_in' }
  let(:user) { create(:user, :super_admin) }
  let(:user_two) { create(:user, :admin) }
  let(:equipment) { create(:equipment) }
  let(:booking) { create(:booking) }
  let(:valid_attributes) { { user: user.id, eequipment: equipment.id, status: booking.status, booking_date: booking.booking_date, description: booking.description, pickup_date: booking.pickup_date, return_date: booking.return_date, booking_price: booking.booking_price } }

  let(:valid_attributes_two) { { user_two: user.id, eequipment: equipment.id, status: booking.status, booking_date: booking.booking_date, description: booking.description, pickup_date: booking.pickup_date, return_date: booking.return_date, booking_price: booking.booking_price } }
  let(:params) do
    {
      user: {
        email: user.email,
        password: user.password
      }
    }
  end

  let(:params_two) do
    {
      user: {
        email: user_two.email,
        password: user_two.password
      }
    }
  end


    # describe "GET /index" do; end

  context 'User with a super_admin role' do
    before do
      post '/users/sign_in', params: params
    end

    it 'creates a new Booking' do
      expect { post '/api/v1/bookings', params: { bookings: valid_attributes } }.to change(Booking, :count).by(1)
    end
  end

  context 'User with an admin role' do
    before do
      post '/users/sign_in', params: params_two
    end

    it 'creates a new Booking' do
      expect { post '/api/v1/bookings', params: { bookings: valid_attributes_two } }.to change(Booking, :count).by(1)
    end
  end
end
