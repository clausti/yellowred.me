class StarsController < ApplicationController
  before_filter :must_be_logged_in
  
  def index
    @stars = current_user.maybes
    render :index
  end
  
  def starred_me
    @stars = current_user.starred_mes
    render :index
  end
  
  def create
    @star = Star.new(params[:star])
    @star.save
    render :json => @star, :status => 200
  end
  
  def destroy
    @star = Star.find(params[:star])
    @star.destroy
    render :json => true, :status => 200
  end
  
end
