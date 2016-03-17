class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :allow_iframe_requests
  
def allow_iframe_requests
  response.headers.delete('X-Frame-Options')
end

  before_filter :configure_permited_parameters, if: :devise_controller?

  protected

  def configure_permited_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, 
      :password, :password_confirmation, :name, :thumbnail)}

    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:email, 
      :password, :password_confirmation, :current_password, :name, :thumbnail)}
    
  end
  
end
