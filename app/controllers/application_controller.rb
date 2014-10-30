class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :logged_in?
  
  def current_user
    return nil unless session[:session_token]
    @user ||= User.find_by(session_token: session[:session_token])
  end
  
  def log_in!(user)
    session[:session_token] = user.reset_session_token!
  end
  
  def log_out!(user)
    user.reset_session_token!
    session[:session_token] = nil
  end
  
  def logged_in
    unless logged_in?
      redirect_to new_session_url
    end
  end
  
  def logged_in?
    User.find_by(session_token: session[:session_token])
  end
end
