class SavedSearchesController < ApplicationController
  
  def show
    # search model will have url: /saved_search. NOT URLROOT
    @search = current_user.saved_search
    render :json => @search
  end
  
  def results
    Profile.transaction do
      @profiles = Profile.includes(:stars, :maybes)
      @profiles -= [current_user.profile]
      @profiles -= current_user.nope_profiles
      @profiles -= current_user.maybe_profiles
      @profiles.shuffle!
    end
    render "profiles/index"
  end
  
  def update
    @search = current_user.saved_search
    search_params = profile_booleans_false.merge(params[:search])
    
    if @search.update_attributes(search_params)
      render :json => true, :status => 200
    else 
      render :json => @search.errors.full_messages, :status => 422
    end
  end
  
end
