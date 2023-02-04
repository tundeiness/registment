require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe 'POST /login' do
    let(:user) { create(:user) }
    let(:url) { '/login' }
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

    context 'when the request is valid' do
      before { post url, params: params }

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
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

    # context 'when params are correct' do
    #   before do
    #     post url, params: params
    #   end

    #   it 'returns status code 200' do
    #     expect(response).to have_http_status(200)
    #   end

    #   it 'returns JTW token in authorization header' do
    #     expect(response.headers['Authorization']).to be_present
    #   end
    # end

    # context 'when login params are incorrect' do
    #   before { post url }

    #   it 'returns unauthorized status' do
    #     expect(response.status).to eq 401
    #   end
    # end
  end


  describe 'DELETE /logout' do

    let(:user) { create(:user) }
    # let(:headers) { { 'Accept' => 'application/json', Authorization: "Bearer #{token}" } }


    before { delete '/logout', headers: headers }

    # before do
    #   jwt = JWT.encode({ user_id: user.id }, Rails.application.credentials.fetch(:secret_key_base), 'HS256')
    #   # headers['Authorization'] = "Bearer #{jwt}"
    #   headers = { Authorization: "Bearer #{jwt}" }
    #   delete '/logout', headers: headers
    # end

    # let(:headers) { { 'Authorization' => "Bearer #{Devise::JWT.encode(user.email, Rails.application.secrets.secret_key_base)}" } }
    let(:headers) { { 'Authorization' => "Bearer #{Devise::JWT.encode_token(user.id, Rails.application.credentials.secret_key_base)}" } }


    it "returns status code 204" do
      # delete "/logout", headers: headers
      expect(response).to have_http_status(204)
    end

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end

    # it 'deletes the current user session' do
    #   expect(response.headers['Authorization']).to be_blank
    # end
  end

  # describe 'DELETE /users/sign_out' do
  #   let(:url) { '/users/sign_out' }

  #   it 'returns 204, no content' do
  #     delete url
  #     expect(response).to have_http_status(204)
  #   end
  # end

  # describe 'POST /users/password' do
    # let(:url) { '/users/password' }
    # let(:params) do
    #   {
    #     user: {
    #       email: 'user@example.com',
    #       password: 'password'
    #     }
    #   }
    # end

    # context 'when user is unauthenticated' do
    #   before { post url, params: params }

    #   it 'returns 200' do
    #     expect(response.status).to eq 200
    #   end

      # it 'returns a new user' do
      #   expect(response.body).to match_schema('user')
      # end
    # end


  #   context 'when user already exists' do
  #     before do
  #       # build :user, email: params[:user][:email]
  #       # let(:user) { create(:user) }
  #       post url, params: params
  #     end

  #     it 'returns bad request status' do
  #       expect(response.status).to eq 400
  #     end

  #     # it 'returns validation errors' do
  #     #   expect(json['errors'].first['title']).to eq('Bad Request')
  #     # end
  #   end
  # end
end
