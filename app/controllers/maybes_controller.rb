class MaybesController < ApplicationController
    
  def maybe_list
    @maybe_profiles = current_user.maybe_profiles.where( 'prefer = true' )
    render :json => @maybe_profiles, :status => 200
  end
  
  def nope_list
    @nope_profiles = current_user.maybe_profiles.where( 'prefer = false' )
    render :json => @nope_profiles, :status => 200
  end
  
  def create
    maybe_params = params[:maybe].merge(:user_id => current_user.id)
    @maybe = Maybe.find_by_ids(maybe_params)

    if @maybe
      @maybe.update_attributes(maybe_params)
    else
      @maybe = Maybe.new(maybe_params)
    end
    
    if @maybe.save
      render :json => @maybe.profile, :status => 200
    else
      render :json => @maybe.errors.full_messages, :status => 422
    end
  end
  
  def update
    
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
