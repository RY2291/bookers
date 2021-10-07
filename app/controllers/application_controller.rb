class ApplicationController < ActionController::Base
  before_action :configure_permitted_paramerters, if: :devise_controller?
  before_action :authenticate_user!, except: [:top, :about]
  
  def after_sign_in_path_for(resource)
    user_path(resource)
  end

  protected

  def configure_permitted_paramerters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
