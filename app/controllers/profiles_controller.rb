class ProfilesController < ApplicationController
  
  def index
    @profiles = Profile.all.shuffle
    render :json => @profiles
  end
  
  def show
    if params[:username]
      @profile = Profile.find_by_username(params[:username])
      if @profile 
        render :json => @profile, :status => 200
      else
        render :json => false, :status => 422
      end
    else
      @profile = current_user.profile
      render :json => @profile, :status => 200
    end
  end
  
  def edit
    @profile = current_user.profile
    render :edit
  end
  
  def update
    @profile = current_user.profile
    profile_params = profile_booleans_false.merge(params[:profile])

    if @profile.update_attributes(profile_params)
      redirect_to root_url
    else
      flash.now[:errors] = @profile.errors.full_messages
      render :edit
    end
  end
  
end
