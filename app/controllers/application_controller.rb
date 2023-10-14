# app/controllers/application_controller.rb
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :update_allowed_parameters, if: :devise_controller?

  protected

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :photo, :posts_counter, :bio, :email, :password)}
    #devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :photo, :posts_counter, :bio, :email, :password, :current_password)}
  end
end
