class SessionsController < ApplicationController

  def create
    @user = User.find_by_credentials(params[:user])

    if @user
      login_user!
      redirect_to root_url
    else
      # render errors as json?
      flash.now[:errors] = ["Invalid username and/or password"]
      @user = User.new(params[:user])
      render :new
    end
  end

  def destroy
    @user = current_user
    logout_user!
    redirect_to lobby_url
  end
  
end
