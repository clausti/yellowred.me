class SavedSearchesController < ApplicationController
  
  def show
    @search = current_user.saved_search
    render :json => @search
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
