require 'rails_helper'

RSpec.describe 'Api::V1::Bookings', type: :request do
  let(:url) { '/users/sign_in' }
  let(:user) { create(:user, :super_admin) }
  # let(:normal) { create(:user, :normal) }
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

  # let(:params_normal) do
  #   {
  #     user: {
  #       email: normal_user.email,
  #       password: normal_user.password
  #     }
  #   }
  # end


    # describe "GET /index" do; end
  describe 'POST /api/v1/bookings' do
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

  describe 'GET /api/v1/bookings' do
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

  # describe 'PUT /api/v1/bookings/:id' do
  #   let!(:booking) { create(:booking) }
  #   let(:valid_attributes) { { status: 'returned' } }
  #   let(:super_admin) { create(:user, :super_admin) }

  #   context 'with super_admin user' do
  #     before do
  #       post '/users/sign_in', params: { user: { email: super_admin.email, password: super_admin.password } }
  #       put "/api/v1/bookings/#{booking.id}", headers: { 'Authorization' => response.header['Authorization'] }
  #     end

  #     it 'updates booking status' do
  #       expect(Booking.find(booking.id).status).to eq('returned')
  #     end

  #     it 'returns a success response' do
  #       expect(response).to have_http_status(:success)
  #     end
  #   end
  # end

  # describe "PUT /api/v1/bookings/:id" do
  #   let!(:booking) { create(:booking) }
  #   # let!(:super_admin) { create(:user, :super_admin) }
  #   # let!(:auth_headers) { super_admin.create_new_auth_token }

  #   context "with valid params" do
  #     let(:booking_params) { { status: "returned" } }

  #     before { put "/api/v1/bookings/#{booking.id}", params: params }

  #     it "returns a successful response" do
  #       expect(response).to be_successful
  #     end

  #     it "updates the booking" do
  #       expect(booking.reload.status).to eq("returned")
  #     end
  #   end

  #   context "with invalid params" do
  #     let(:booking_params) { { status: nil } }

  #     before { put "/api/v1/bookings/#{booking.id}", params: params }

  #     it "returns an unprocessable entity response" do
  #       expect(response).to have_http_status(:unprocessable_entity)
  #     end

  #     it "does not update the booking" do
  #       expect(booking.reload.status).to_not be_nil
  #     end
  #   end
  # end
end
