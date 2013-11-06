class MaybesController < ApplicationController
    
  def maybe_list
    @maybes = current_user.maybes.where( 'prefer = true' )
    render :json => @maybes, :status => 200
  end
  
  def nope_list
    @nopes = current_user.maybes.where( 'prefer = false' )
    render :json => @nopes, :status => 200
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
