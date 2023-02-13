require 'rails_helper'
# require 'json'

RSpec.describe 'Users', type: :request do
  describe 'POST /users/sign_in' do
    let(:user) { create(:user) }
    let(:url) { '/users/sign_in' }
    let(:params) do
      {
        user: {
          email: user.email,
          password: user.password
        }
      }
    end

    context 'when the request is valid' do
      before { post url, params: params }

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns JTW token in authorization header' do
        expect(response.headers['Authorization']).to be_present
      end
    end

    context 'when the request is invalid' do
      before { post url, params: '' }

      it 'returns status code 401' do
        expect(response).to have_http_status(401)
      end

      it 'returns a validation failure message' do
        expect(response.body).to include('You need to sign in or sign up before continuing.')
      end
    end
  end

  describe 'POST /users' do
    let(:url) { '/users' }
    let(:super_admin) { create(:user, :super_admin) }
    let(:valid_attributes) { attributes_for(:user) }

    before { post url }

    context 'with valid parameters' do
      it 'creates a new User' do
        expect { post url, params: { user: valid_attributes } }.to change(User, :count).by(1)
      end

      it 'returns a 200 status code' do
        post url, params: { user: valid_attributes }
        expect(response).to have_http_status(200)
      end
    end
  end
end
