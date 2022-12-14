class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    # devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:email, :password, :avatar) }

    # devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:email, :password, :current_password, :avatar) }
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :photo])

    devise_parameter_sanitizer.permit(:account_update, keys: [:email, :password, :current_password, :photo])
  end

  def default_url_options
    { host: ENV["DOMAIN"] || "localhost:3000" }
  end
end
