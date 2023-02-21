class MembersController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :authenticate_user!, only: [:all_users]

  def index
    render json: { status: { code: 200, message: 'Current logged in user' }, data: current_user }
  end

  def all_users
    render json: { status: { code: 200, message: 'All users' }, data: User.all }
  end
end
