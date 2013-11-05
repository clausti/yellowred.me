class SavedSearchesController < ApplicationController
  
  def show
    @search = current_user.saved_search
    
    render :show
  end
  
  def update
    @search = current_user.saved_search
    
    if !@search.update_attributes(params[:search])
      flash.now[:errors] = @search.errors.full_messages
    end
    
    render :show
  end
  
end
