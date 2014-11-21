class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up)
  end

  def require_admin!
    unless user_signed_in? && current_user.admin?
      redirect_to root_url, alert: "You do not have permission!"
    end
  end
end
