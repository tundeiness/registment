require 'rails_helper'

RSpec.describe 'Api::V1::Bookings', type: :request do
  # let(:url) { '/users/sign_in' }
  let(:user_two) { create(:user, :admin) }

  let(:params_two) do
    {
      user: {
        email: user_two.email,
        password: user_two.password
      }
    }
  end

  describe 'POST /api/v1/bookings' do
    let(:user) { create(:user, :super_admin) }
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

    let(:booking) { create(:booking) }
    let(:equipment) { create(:equipment) }
    let(:valid_attributes) { { user: user.id, eequipment: equipment.id, status: booking.status, booking_date: booking.booking_date, description: booking.description, pickup_date: booking.pickup_date, return_date: booking.return_date, booking_price: booking.booking_price } }

    let(:valid_attributes_two) { { user_two: user.id, eequipment: equipment.id, status: booking.status, booking_date: booking.booking_date, description: booking.description, pickup_date: booking.pickup_date, return_date: booking.return_date, booking_price: booking.booking_price } }


    context 'User with a super_admin role' do
      before do
        post '/users/sign_in', params: params
      end

      it 'creates a new Booking' do
        expect { post '/api/v1/bookings', params: { booking: valid_attributes } }.to change(Booking, :count).by(1)
      end
    end

    context 'User with an admin role' do
      before do
        post '/users/sign_in', params: params_two
      end

      it 'creates a new Booking' do
        expect { post '/api/v1/bookings', params: { booking: valid_attributes_two } }.to change(Booking, :count).by(1)
      end
    end
  end

  describe 'GET /api/v1/bookings' do
    let(:user) { create(:user, :super_admin) }
    let(:params) do
      {
        user: {
          email: user.email,
          password: user.password
        }
      }
    end
    let!(:booking) { create_list(:booking, 10) }

    context 'User with a super_admin role' do
      before do
        post '/users/sign_in', params: params
      end

      it 'can get all Bookings record' do
        get '/api/v1/bookings'

        expect(response).to have_http_status(200)
        parsed_response = JSON.parse(response.body)
        expect(parsed_response.count).to eq(10)
      end
    end
  end

  describe 'DELETE /api/v1/bookings/:id' do
    let(:super_admin) { create(:user, :super_admin) }
    let!(:booking) { create(:booking) }

    before do
      post '/users/sign_in', params: { user: { email: super_admin.email, password: super_admin.password } }
      delete "/api/v1/bookings/#{booking.id}", headers: { 'Authorization' => response.header['Authorization'] }
    end

    it 'deletes a booking successfully' do
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)['message']).to eq('Booking deleted')
    end
  end


  describe 'PUT /api/v1/bookings/:id' do
    let(:user) { create(:user, :super_admin) }
    let!(:booking) { create(:booking, :returned) }
    let(:equipment) { create(:equipment) }

    let(:params) do
      {
        user: {
          email: user.email,
          password: user.password
        }
      }
    end

    let(:booking_params) do
      {
        booking: {
          status: booking.status,
          booking_date: booking.booking_date,
          description: booking.description,
          pickup_date: booking.pickup_date,
          return_date: booking.return_date,
          booking_price: booking.booking_price,
          user_id: user.id,
          equipment_id: equipment.id
        }
      }
    end

    context 'with super_admin user' do
      before do
        post '/users/sign_in', params: params
        put "/api/v1/bookings/#{booking.id}", params: booking_params, headers: { 'Authorization' => response.header['Authorization'] }
      end

      it 'updates booking status' do
        expect(Booking.find(booking.id).status).to eq('returned')
      end

      it 'returns a success response' do
        expect(response).to have_http_status(:success)
      end

      it 'updates booking' do
        expect(booking.reload.status).to eq('returned')
      end
    end
  end

  describe 'PUT /api/v1/bookings/:id' do
    let(:user) { create(:user, :normal) }
    let!(:booking) { create(:booking, :returned) }
    let(:equipment) { create(:equipment) }
    let(:normal_params) do
      {
        user: {
          email: user.email,
          password: user.password
        }
      }
    end

    let(:params) do
      {
        booking: {
          status: booking.status,
          booking_date: booking.booking_date,
          description: booking.description,
          pickup_date: booking.pickup_date,
          return_date: booking.return_date,
          booking_price: booking.booking_price,
          user_id: user.id,
          equipment_id: equipment.id
        }
      }
    end

    context 'when user is not authorized' do
      before do
        post '/users/sign_in', params: normal_params
      end

      it 'returns 403 Forbidden' do
        expect { put "/api/v1/bookings/#{booking.id}", params: params, headers: { 'Authorization' => response.header['Authorization'] } }.to raise_error(CanCan::AccessDenied, 'You are not authorized to access this page.')
      end
    end
  end
end
