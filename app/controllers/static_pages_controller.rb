class StaticPagesController < ApplicationController
  before_filter :must_be_logged_in, :except => :lobby
  
  def home 
    @user = current_user
    @saved_search = current_user.saved_search
    
    render :home
  end
  
  def lobby
    @user = User.new
    render :lobby
  end
  
end
