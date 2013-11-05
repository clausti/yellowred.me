class ProfilesController < ApplicationController
  
  def show
    if params[:username]
      @profile = Profile.find_by_username(params[:username])
    else
      @profile = current_user.profile
    end
    render :json => @profile, :status => 200
  end
  
  def edit #will only be hit on intial profile edit after signup
    @profile = current_user.profile
    render :edit
  end
  
  def update
    @profile = current_user.profile
    
    if @profile.update_attributes(params[:profile])
      render :json => @profile, :status => 200
    else
      render :json => @profile.errors.full_messages, :status => 422
    end
  end
  
end
