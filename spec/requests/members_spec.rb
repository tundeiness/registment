require 'rails_helper'

RSpec.describe 'Members', type: :request do
  describe 'GET /members' do
    let(:user) { create(:user, :super_admin) }
    let(:params) do
      {
        user: {
          email: user.email,
          password: user.password
        }
      }
    end

    before do
      post '/users/sign_in', params: params
    end

    it 'returns http success' do
      get '/members'
      expect(response).to have_http_status(200)
      expect(response).to have_http_status(:success)
    end
  end
end
