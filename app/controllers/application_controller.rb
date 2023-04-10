class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:image,:name, :email, :password)}

    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:image,:name, :email, :password, :current_password)}
  end
  def current_room
    @current_room_id=0
  end
  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
  end
end
