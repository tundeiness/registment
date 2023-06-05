require 'rails_helper'

RSpec.describe 'Api::V1::Equipments', type: :request do
  let(:url) { '/users/sign_in' }
  let(:equipment) { create(:equipment) }
  let(:valid_attributes) { { brand_name: equipment.brand_name, condition: equipment.condition, serial_no: equipment.serial_no, date_acquired: equipment.date_acquired, description: equipment.description, model_number: equipment.model_number, supplier: equipment.supplier, loan_status: equipment.loan_status } }
  let(:params) do
    {
      user: {
        email: user.email,
        password: user.password,
        role: user.role
      }
    }
  end

  let(:user) { create(:user, role: 'super_admin') }


  context 'with a super_admin' do
    before do
      post '/users/sign_in', params: params
    end

    it 'creates a new Equipment' do
      expect { post '/api/v1/equipments', params: { equipment: valid_attributes } }.to change(Equipment, :count).by(1)
    end
  end

  context 'without valid params' do
    before do
      post '/users/sign_in', params: params
    end

    let(:invalid_attributes) { { name: nil, category: nil } }

    it 'returns status code 422' do
      post '/api/v1/equipments', params: { equipment: invalid_attributes }
      expect(response).to have_http_status(422)
    end
  end

  describe 'GET /api/v1/equipments' do
    let(:super_admin) { create(:user, :super_admin) }
    let!(:equipment) { create_list(:equipment, 3) }


    before do
      post '/users/sign_in', params: { user: { email: super_admin.email, password: super_admin.password } }
    end

    it 'returns all equipment' do
      get '/api/v1/equipments'

      expect(response).to have_http_status(200)
      parsed_response = JSON.parse(response.body)
      expect(parsed_response.count).to eq(3)
    end
  end

  # SUPER ADMIN DELETES AN EQUIPMENT
  describe 'DELETE /api/v1/equipments/:id' do
    let(:super_admin) { create(:user, role: 'super_admin') }
    let!(:equipment) { create(:equipment) }
    let(:valid_attributes) { { id: equipment.id } }


    before do
      post '/users/sign_in', params: { user: { email: super_admin.email, password: super_admin.password } }
      delete "/api/v1/equipments/#{equipment.id}", headers: { 'Authorization' => response.header['Authorization'] }
    end

    it 'destroys the requested equipment' do
      expect { equipment.reload }.to raise_error(ActiveRecord::RecordNotFound)
    end

    it 'returns a 200 status' do
      expect(response).to have_http_status(200)
    end
  end

  # SUPER ADMIN UPDATES AN EQUIPMENT
  describe 'PUT /api/v1/equipments/:id' do
    let!(:equipment) { create(:equipment) }
    let(:valid_attributes) { { brand_name: 'Updated Name' } }
    let(:super_admin) { create(:user, role: 'super_admin') }

    context 'with super_admin user' do
      before do
        post '/users/sign_in', params: { user: { email: super_admin.email, password: super_admin.password } }
        put "/api/v1/equipments/#{equipment.id}", params: { equipment: valid_attributes }
      end

      it 'updates the requested equipment' do
        expect(Equipment.find(equipment.id).brand_name).to eq('Updated Name')
      end

      it 'returns a success response' do
        expect(response).to have_http_status(:success)
      end
    end
  end

  describe 'PUT /api/v1/equipments/:id' do
    let(:user) { create(:user, :normal) }
    let(:equipment) { create(:equipment) }

    let(:normal_params) do
      {
        user: {
          email: user.email,
          password: user.password
        }
      }
    end

    # NORMAL USER CANNOT UPDATE AN EQUIPMENT
    context 'when user is not authorized' do
      before do
        post '/users/sign_in', params: normal_params
      end

      it 'returns 403 Forbidden' do
        expect { put "/api/v1/equipments/#{equipment.id}" }.to raise_error(CanCan::AccessDenied, 'You are not authorized to access this page.')
      end
    end
  end

  describe 'GET /api/v1/equipments/booking_count' do
    let(:super_admin) { create(:user, :super_admin) }
    let(:equipment) { create(:equipment) }
    let(:booking) { create(:booking) }

    let(:valid_attributes) { { user: user.id, equipment: equipment.id, status: booking.status, booking_date: booking.booking_date, description: booking.description, pickup_date: booking.pickup_date, return_date: booking.return_date, booking_price: booking.booking_price } }

    before do
      post '/users/sign_in', params: { user: { email: super_admin.email, password: super_admin.password } }
      post '/api/v1/bookings', params: { booking: valid_attributes }
      get '/api/v1/equipments/booking_count'
    end

    it 'returns equipments with booking counts' do
      expect(response).to have_http_status(:ok)
      parsed_response = JSON.parse(response.body, symbolize_names: true)
      expect(parsed_response[0][:booking_count]).to eq(1)
    end
  end

  describe 'GET /api/v1/equipments/by_condition' do
    let(:super_admin) { create(:user, :super_admin) }
    let!(:equipment1) { create(:equipment, condition: 'new') }
    let!(:equipment2) { create(:equipment, condition: 'damaged') }
    let!(:equipment3) { create(:equipment, condition: 'intact') }

    before do
      post '/users/sign_in', params: { user: { email: super_admin.email, password: super_admin.password } }
      get '/api/v1/equipments/by_condition'
    end

    it 'returns equipments with their conditions' do
      parsed_response = JSON.parse(response.body)
      expect(parsed_response.count).to eq(3)
      expect(parsed_response).to include('intact' => 1, 'new' => 1, 'damaged' => 1)
    end

    it 'returns a status code of 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /api/v1/equipments/loan_status_count' do
    # some code
    let(:super_admin) { create(:user, :super_admin) }
    let!(:equipment1) { create(:equipment, loan_status: 'available') }
    let!(:equipment2) { create(:equipment, loan_status: 'booked') }
    let!(:equipment3) { create(:equipment, loan_status: 'on_loan') }
    let!(:equipment4) { create(:equipment, loan_status: 'in_store') }
    let!(:equipment5) { create(:equipment, loan_status: 'not_available') }
    let!(:equipment6) { create(:equipment, loan_status: 'available') }
    before do
      post '/users/sign_in', params: { user: { email: super_admin.email, password: super_admin.password } }
      get '/api/v1/equipments/loan_status_count'
    end

    it 'returns equipments with their loan status' do
      parsed_response = JSON.parse(response.body)
      expect(parsed_response.count).to eq(5)
      expect(parsed_response).to include('available' => 2, 'booked' => 1, 'on_loan' => 1, 'in_store' => 1 , 'not_available' => 1)
    end

    it 'returns a status code of 200' do
      expect(response).to have_http_status(200)
    end
  end
end
