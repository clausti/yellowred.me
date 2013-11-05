class MaybesController < ApplicationController
  before_filter :must_be_logged_in
  
  def index
    @maybes = current_user.maybes
    render :index
  end
  
  def create
    @maybe = Maybe.new(params[:maybe])
    @maybe.save
    render :json => @maybe, :status => 200
  end
  
  def destroy
    @maybe = Maybe.find(params[:maybe])
    @maybe.destroy
    render :json => true, :status => 200
  end
  
end
