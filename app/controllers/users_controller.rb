class UsersController < ApplicationController
  
  def new
    @user = User.new

    render :new
  end

  def create
    @user = User.new(params[:user])

    if @user.save
      login_user!
      # redirect_to home_url
    else
      #render errors as json?
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def show #users profile page
    @user = current_user

    render :show
  end
  
end
