class StaticPagesController < ApplicationController
  
  def home 
    @user = current_user
    @saved_search = current_user.saved_search
    
    render :home
  end
  
end
