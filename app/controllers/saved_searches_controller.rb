class SavedSearchesController < ApplicationController
  
  def show
    # search model will have url: /saved_search. NOT URLROOT
    @search = current_user.saved_search
    render :json => @search
  end
  
  def results
    # search collection will have url: saved_search/results
    # @profiles = all the profiles that match the search somehow
    @profiles = Profile.all #for now
    render :json => @profiles
  end
  
  def update
    @search = current_user.saved_search
    
    search_params = profile_booleans_false.merge(params[:search])
    
    if @search.update_attributes(search_params)
      render :json => @search
    else 
      render :json => @search.errors.full_messages, :status => 422
    end
  end
  
end
