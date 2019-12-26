class ApplicationController < ActionController::Base
  # --- Adds: name to devise ------
  before_action :configure_permitted_parameters, if: :devise_controller?

  # Signin Singup Redirects
  def after_sign_in_path_for(resource)
    if current_user
      # flash[:notice] = "Logged in!" 
      mypage_path(resource)
    else
      # flash[:notice] = "Signup!" 
      mypage_path(resource)
    end
  end


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    # Adds: username
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:username])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username])
  end

  #--------------------------------
end
