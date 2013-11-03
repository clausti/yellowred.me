class StaticPagesController < ApplicationController
  before_filter :must_be_logged_in
  
  def home 
    
    render :home
  end
  
end
