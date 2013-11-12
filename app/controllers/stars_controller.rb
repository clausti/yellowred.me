class StarsController < ApplicationController
  
  def index
    @profiles = current_user.starred_profiles
    render "profiles/index"
  end
  
  def starred_me
    @profiles = current_user.starring_profiles
    render "profiles/index"
  end
  
  def create
    @star = Star.new(:profile_id => params[:profile_id], :user_id => current_user.id)
    if @star.save
      render :json => @star.profile, :status => 200
    else
      render :json => @star.errors.full_messages, :status => 422
    end
  end
  
  def destroy
    star_params = { :profile_id => params[:profile_id], :user_id => current_user.id }
    @star = Star.find_by_ids(star_params)
    if @star.destroy
      render :json => params[:profile_id], :status => 200
    else
      render :json => @star.errors.full_messages, :status => 422
    end
  end
  
end
