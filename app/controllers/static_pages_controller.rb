class StaticPagesController < ApplicationController
  
  def home 
    @user = current_user
    @search = current_user.saved_search
    @profile = Profile.new
    
    render :home
  end
  
end
