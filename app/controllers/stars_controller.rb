class StarsController < ApplicationController
  
  def index
    @stars = current_user.stars
    render :json => @stars
  end
  
  def starred_me
    @stars = current_user.profile.stars
    render :json => @stars
  end
  
  def create
    @star = Star.new(params[:star])
    if @star.save
      render :json => @star, :status => 200
    else
      render :json => @star.errors.full_messages, :status => 422
    end
  end
  
  def destroy
    @star = Star.find(params[:star])
    if @star.destroy
      render :json => true, :status => 200
    else
      render :json => @star.errors.full_messages, :status => 422
    end
  end
  
end
