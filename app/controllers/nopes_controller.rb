class NopesController < ApplicationController
  
  def index
    @nopes = current_user.nopes
    render :index
  end
  
  def create
    @nope = Nope.new(params[:nope])
    @nope.save
    render :json => @nope, :status => 200
  end
  
  def destroy
    @nope = Nope.find(params[:nope])
    @nope.destroy
    render :json => true, :status => 200
  end
  
end
