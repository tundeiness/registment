class ApplicationController < ActionController::API
  before_filter :configure_permitted_parameters

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |param| param.permit(:first_name, :last_name, :email, :phone, :address, :password, :confirmation) }
    devise_parameter_sanitizer.for(:account_update) { |param| param.permit(:name, :email, :password, :current_password) }
  end
end
