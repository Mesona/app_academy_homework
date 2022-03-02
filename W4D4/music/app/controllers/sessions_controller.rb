class SessionsController < ApplicationController

  def new
    render :new
  end

  def create
    @user = User.find_by_credentials(params[:user][:email], params[:user][:password])
    @user.id = current_user.id

    if @user
      login!(@user)
      session[:session_token] = @user.reset_session_token!
      redirect_to user_url(@user)
    else
      redirect_to users_url
    end
  end

  def destroy
    logout!
    redirect_to new_session_url
  end
end
