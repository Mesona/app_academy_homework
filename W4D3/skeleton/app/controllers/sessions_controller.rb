class SessionsController < ApplicationController

  before_action :require_logout, only: [:new, :create]

  def new
    
  end

  def create
    @user = User.find_by_credentials(params[:session][:username], params[:session][:password])

    if @user
      login! @user
      session[:session_token] = @user.reset_session_token!
      redirect_to cats_url
    else
      redirect_to new_session_url
    end
  end

  def destroy
    logout!
    redirect_to new_session_url
  end

  private
  def session_params
    params.require(:session).permit(:username, :password)
  end
end
