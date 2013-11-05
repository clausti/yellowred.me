class StarsController < ApplicationController
  
  def index
    @stars = current_user.stars
    render :index
  end
  
  def starred_me
    @stars = current_user.profile.stars
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
