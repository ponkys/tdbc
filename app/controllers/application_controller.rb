class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :configure_permited_parameters, if: :devise_controller?

  protected

  def configure_permited_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, 
      :password, :password_confirmation, :title}

    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:email, 
      :password, :password_confirmation, :current_password, :title, :description, 
      :itunes)}
    
  end

  def podindex
    render "/podindex"
  end

  def podshow
    render "/podshow"
  end

  def episodeshow
    render "/episodeshow"
  end
  
  def dashboard
    render "/dashboard"
  end

  def signin
    render "/sign-in"
  end

  def signup
    render "/sign-up"
  end
end
