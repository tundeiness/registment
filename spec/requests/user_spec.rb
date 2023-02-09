require 'rails_helper'
require 'json'

RSpec.describe "Users", type: :request do
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
    # let(:headers) { get_headers(user) }
    # let(:headers) { headers(user.email) }

    # it 'returns a success response' do
    #   post '/users/sign_in', headers: headers
    #   expect(response).to be_successful
    # end

    # let(:token_from_request) { post '/users/sign_in', params: params, headers: headers }
    # let(:headers) { { Authorization: "Bearer #{token_from_request}" } }

    context 'when the request is valid' do
      before { post url, params: params }

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns JTW token in authorization header' do
        expect(response.headers['Authorization']).to be_present
      end

      # it 'returns valid JWT token' do
      #   token_from_request = response.headers['Authorization'].split(' ').last
      #   # binding.pry
      #   puts "Token from request: #{token_from_request}"
      #   decoded_token = JWT.decode(token_from_request, Rails.application.credentials.jwt_secret, true)

      #   puts "decoded token: #{decoded_token.first['sub']}"
      #   expect(decoded_token.first['sub']).to be_present
      # end

      # it "returns a valid JWT token" do
      #   decoded_token = JWT.decode(token_from_request, Rails.application.credentials.jwt_secret, true)

      #   # expect(decoded_token.first["sub"]).to eq user.id.to_s
      #   puts decoded_token
      #   expect(decoded_token.first["email"]).to eq user.email
      # end
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
end
