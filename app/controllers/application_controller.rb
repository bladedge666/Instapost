class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller? #whitelist photo and name

  protect_from_forgery with: :exception

  # for whitelisting purposes
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:email, :password, :password_confirmation, :name, :photo) }
    devise_parameter_sanitizer.permit(:sign_in) { |u| u.permit(:email, :password, :remember_me) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:email, :password, :password_confirmation, :name, :photo) }
  end
end
