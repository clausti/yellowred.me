class SavedSearchesController < ApplicationController
  
  def show
    @search = current_user.saved_search
    render :json => @search
  end
  
  def update
    @search = current_user.saved_search
    
    if @search.update_attributes(params[:search])
      render :json => @search
    else 
      render :json => @search.errors.full_messages, :status => 422
    end
  end
  
end
