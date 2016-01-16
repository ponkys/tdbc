class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  	def index
  	if session[:user]
  		@user = User.find(session[:user])
  	end
  	render "/index"
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
