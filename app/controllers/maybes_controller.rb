class MaybesController < ApplicationController
    
  def index
    @maybes = current_user.maybes
    render :json => @maybes, :status => 200
  end
  
  def create
    @maybe = Maybe.new(params[:maybe])
    if @maybe.save
      render :json => @maybe, :status => 200
    else
      render :json => @maybe.errrors.full_messages, :status => 422
    end
  end
  
  def destroy
    @maybe = Maybe.find(params[:maybe])
    if @maybe.destroy
      render :json => true, :status => 200
    else
      render :json => @maybe.errrors.full_messages, :status => 422
    end
  end
  
end
