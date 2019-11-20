class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  def after_sign_in_path_for(resource)
    home_index_path
  end
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :handle, :email, :password, :picture)}
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :handle, :email, :password, :current_password, :picture)}
  end
end
