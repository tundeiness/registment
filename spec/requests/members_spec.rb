require 'rails_helper'

RSpec.describe 'Members', type: :request do
  describe 'GET /members' do
    let(:user) { create(:user, :super_admin) }
    let(:normal_user) { create(:user, :normal) }
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
        normal_user: {
          email: user.email,
          password: user.password
        }
      }
    end

    context 'User with a super_admin role' do
      before do
        post '/users/sign_in', params: params
      end

      it 'can get all registered users' do
        get '/members'

        expect(response).to have_http_status(200)
        expect(response).to have_http_status(:success)
      end
    end

    context 'User with a normal role' do
      before do
        post '/users/sign_in', params: params_two
      end

      it 'cannot get all registered users' do
        get '/members'

        expect(response).to have_http_status(401)
      end
    end
  end
end
