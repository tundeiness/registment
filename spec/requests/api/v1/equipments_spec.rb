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
    # let(:user) { create(:user, :super_admin) }
    # let(:headers) { { Authorization: "Bearer #{user.token}" } }

    before do
      post '/users/sign_in', params: params
      # user.reload
      # post '/users', params: { user: { email: 'test@example.com', password: 'password', role: 'super_admin' } }
    end


    # before do
    #   FactoryBot.create_list(:equipment, 10)
    #   get '/api/v1/equipments'
    # end

    context 'with a super_admin' do
      # before do
      #   sign_in super_admin
      # end
      # let(:user) { create(:user, :super_admin) }
      # before { post user }

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
end
