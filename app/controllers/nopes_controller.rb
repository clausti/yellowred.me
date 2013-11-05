class NopesController < ApplicationController
  
  def index
    @nopes = current_user.nopes
    render :json => @nopes, :status => 200
  end
  
  def create
    @nope = Nope.new(params[:nope])
    if @nope.save
      render :json => @nope, :status => 200
    else
      render :json => @nope.errrors.full_messages, :status => 422
    end 
  end
  
  def destroy
    @nope = Nope.find(params[:nope])
    if @nope.destroy
      render :json => true, :status => 200
    else
      render :json => @nope.errrors.full_messages, :status => 422
    end
  end
  
end
