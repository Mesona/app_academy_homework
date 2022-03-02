class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?, :log_in_user!

  def login!(user)
    session[:session_token] = user.reset_session_token!
  end

  def logout!
    current_user.reset_session_token! if current_user
    session[:session_token] = nil
  end

  def current_user
    @user ||= User.find_by(session_token: session[:session_token])
  end

  def logged_in?
    !!current_user
  end

  def log_in_user!(email)
    @user = User.find_by(email: email)
    session[:session_token] = @user.reset_session_token!
  end
end
