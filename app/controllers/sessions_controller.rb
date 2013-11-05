class SessionsController < ApplicationController
  skip_before_filter :must_be_logged_in, :only => :create

  def create
    @user = User.find_by_credentials(params[:user])
    if @user
      login_user!
      redirect_to root_url
    else
      # not rendering as json. just putting on the page.
      # can change later to a backbone view?
      flash[:errors] = ["Invalid username and/or password"]
      redirect_to lobby_url
    end
  end

  def destroy
    @user = current_user
    logout_user!
    redirect_to lobby_url
  end
  
end
