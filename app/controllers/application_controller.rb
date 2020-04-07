class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :initialize_user

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:full_name, :user_name, :shop_name, :email, :password)}

    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:full_name, :user_name, :shop_name, :email, :password, :current_password)}
  end

  def initialize_user
    @user = User.new
  end

end
