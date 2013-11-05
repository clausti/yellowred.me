class ProfilesController < ApplicationController
  before_filter :must_be_logged_in
  
  def show
    if params[:username] #want the urls to be by username not sure how yet
      @profile = Profile.find_by_username(params[:username])
      render :show
    else
      @profile = current_user.profile
      render :show
    end
  end
  
  def edit
    @profile = current_user.profile
    render :edit
  end
  
  def update
    @profile = current_user.profile
    
    if @profile.update_attributes(params[:profile])
      redirect_to home_url
    else
      flash.now[:errors] = @profile.errors.full_messages
      render :edit
    end
  end
  
end
