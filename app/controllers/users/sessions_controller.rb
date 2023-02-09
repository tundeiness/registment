class Users::SessionsController < Devise::SessionsController
  respond_to :json

  private

  def respond_with(resource, _options = {})
    # render json: {
    #   status: { code: 200, message: 'Sign in successful', data: current_user }
    # }, status: :ok

    # render json: {
    #   status: { code: 200, message: 'Sign in successful', data: current_user }
    # }, status: :ok
    # render json: resource
    if resource.persisted?
      access_token = encode_token(id: resource.id)
      render json: { status: { code: 200, message: 'Signed in successfully' }, data: resource, access_token: access_token }
    else
      render json: { status: { code: 500, message: 'User could not be signed in' }, errors: resource.errors.full_mesages }
    end
  end

  def respond_to_on_destroy
    puts request.headers['Authorization'].split(' ')[1]
    jwt_payload = JWT.decode(request.headers['Authorization'].split(' ')[1], Rails.application.credentials.fetch(:secret_key_base)).first

    puts jwt_payload
    current_user = User.find(jwt_payload['sub'])


    if current_user
      render json: { status: { code: 200, message: 'Signed out successfully'}, data: current_user }
    else
      render json: { status: { code: 401, message: 'User could not be signed out' } }
    end
    # head :no_content
    # authorization_header = request.headers['Authorization']

    # return render json: { status: 401, message: 'No authorization header found' }, status: :unauthorized unless authorization_header

    # jwt_token = authorization_header.split(' ').last
    # return render json: { status: 401, message: 'No JWT token found' }, status: :unauthorized unless jwt_token

    # begin
    #   jwt_payload = JWT.decode(jwt_token, Rails.application.credentials.fetch(:secret_key_base)).first
    # rescue JWT::DecodeError
    #   return render json: { status: 401, message: 'Couldn\'t decode JWT token' }, status: :unauthorized
    # end

    # current_user = User.find_by(id: jwt_payload['sub'])
    # return render json: { status: 401, message: 'Couldn\'t find an active session' }, status: :unauthorized unless current_user

    # sign_out current_user
    # render json: { status: 200, message: 'Sign out successful' }, status: :ok

    # jwt_payload = JWT.decode(request.headers['Authorization'].split(' ')[1], Rails.application.credentials.fetch(:secret_key_base)).first
    # # jwt_payload = JWT.decode(request.headers['Authorization'].split(' ')[1], Rails.application.credentials.fetch(:secret_key_base)).first
    # current_user = User.find(jwt_payload['sub'])
    # if current_user
    #   render json: {
    #     status: 200,
    #     message: 'sign out successful'
    #   }, status: :ok
    # else
    #   render json: {
    #     status: 401,
    #     message: 'user has no active session'
    #   }, status: :unauthorized
    # end
  end


  # def destroy
  #   if current_user
  #     sign_out current_user
  #     render json: {
  #       status: 200, message: 'Sign out successful'
  #     }, status: :ok
  #   else
  #     render json: {
  #       status: 401,
  #       message: 'Couldn\'t find an active session'
  #     }, status: :unauthorized
  #   end
  # end
end
