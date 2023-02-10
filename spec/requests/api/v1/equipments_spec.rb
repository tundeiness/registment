require 'rails_helper'

RSpec.describe 'Api::V1::Equipments', type: :request do
  # describe 'GET /index' do
    # let(:user) { create(:user) }
    let(:url) { '/users/sign_in' }
    let(:equipment) { create(:equipment) }
    # let(:super_admin) { create(:user, first_name: 'admin staff', role: 'super_admin') }
    let(:valid_attributes) { { brand_name: equipment.brand_name, condition: equipment.condition, serial_no: equipment.serial_no, date_acquired: equipment.date_acquired, description: equipment.description, model_number: equipment.model_number, supplier: equipment.supplier, loan_status: equipment.loan_status } }
    # let(:valid_attributes) { attributes_for(:user) }
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
        # user.reload
        # post '/users', params: { user: { email: 'test@example.com', password: 'password', role: 'super_admin' } }
      end

      it 'creates a new Equipment' do
        expect { post '/api/v1/equipments', params: { equipment: valid_attributes } }.to change(Equipment, :count).by(1)
        # expect(response).to have_http_status(201)
      end

      # it 'returns status code 201' do
      #   post '/api/v1/equipments', params: { equipment: valid_attributes }
      #   expect(response).to have_http_status(201)
      # end
    end

      # it 'returns all equipment' do
      #   post url, params: { user: valid_attributes }
      #   expect(json.size).to eq(10)
      # end

      # it 'returns status code 200' do
      #   expect(response).to have_http_status(:success)
      # end
    # end

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
end
