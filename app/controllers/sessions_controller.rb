class SessionsController < ApplicationController
  skip_before_filter :must_be_logged_in, :only => :create

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
