class UsersController < ApplicationController
  
  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(params[:user])

    if @user.save
      Profile.create(:user_id => @user.id)
      SavedSearch.create(:user_id => @user.id)
      login_user!
      redirect_to edit_profile_url
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end
  
end
