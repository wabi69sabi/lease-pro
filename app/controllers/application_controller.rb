class ApplicationController < ActionController::Base
  # before_action :require_login
  #
  # private
  #
  # def require_login
  #   unless user_signed_in?
  #     flash[:error] = "You must be logged in to access this section"
  #     redirect_to new_user_session_path # halts request cycle
  #   end
  # end

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    attributes = [:first_name, :last_name, :email, :role]
    devise_parameter_sanitizer.permit(:sign_up, keys: attributes)
    devise_parameter_sanitizer.permit(:account_update, keys: attributes)
  end

  rescue_from "AccessGranted::AccessDenied" do |exception|
    redirect_to root_path, alert: "You don't have permission to access this page."
  end
end
