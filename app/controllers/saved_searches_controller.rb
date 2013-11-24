class SavedSearchesController < ApplicationController
  
  def show
    # search model will have url: /saved_search. NOT URLROOT
    @search = current_user.saved_search
    render :json => @search
  end
  
  def results
    @profiles = current_user.saved_search.find_matches
    @profiles -= current_user.all_maybe_profiles
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
