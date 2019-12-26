class ApplicationController < ActionController::Base
  # Adds: reject not-signin users
  before_action :authenticate_user!

  # --- Adds: name to devise ------
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
  #--------------------------------
end
