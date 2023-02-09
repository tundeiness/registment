class ApplicationController < ActionController::API
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |param| param.permit(:first_name, :last_name, :email, :phone, :address, :password, :confirmation) }
    devise_parameter_sanitizer.permit(:sign_in) { |param| param.permit(:email, :password) }
    devise_parameter_sanitizer.permit(:account_update) { |param| param.permit(:first_name, :last_name, :email, :phone, :address, :password, :current_password) }
  end
end
