class SessionsController < ApplicationController
  skip_before_filter :must_be_logged_in, :only => [:create, :lobby]
  
  def lobby
    @user = User.new
    render :lobby
  end

  def create
    @user = User.find_by_credentials(params[:user])
    if @user
      login_user!
      redirect_to root_url
    else
      @user = User.new(params[:user])
      flash.now[:errors] = ["Invalid username and/or password"]
      render :lobby
    end
  end

  def destroy
    @user = current_user
    logout_user!
    redirect_to lobby_url
  end
  
end
