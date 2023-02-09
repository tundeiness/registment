class ApplicationController < ActionController::API
  before_action :configure_permitted_parameters, if: :devise_controller?
  # respond_to :json
  # include ActionController::MimeResponds

  def encode_token(payload)
    JWT.encode(payload, 'my_s3cr3t')
  end

  def headers
    request.headers['Authorization']
  end

  def decode_token
    if headers
      access_token = headers.split(' ')[1]
      begin
        JWT.decode(access_token, 'my_s3cr3t', true, algorithm: 'HS256')
      rescue JWT::DecodeError
        nil
      end
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |param| param.permit(:first_name, :last_name, :email, :phone, :address, :password, :confirmation) }
    devise_parameter_sanitizer.permit(:sign_in) { |param| param.permit(:email, :password) }
    devise_parameter_sanitizer.permit(:account_update) { |param| param.permit(:first_name, :last_name, :email, :phone, :address, :password, :current_password) }
  end
end
