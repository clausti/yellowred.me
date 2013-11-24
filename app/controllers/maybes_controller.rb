class MaybesController < ApplicationController
    
  def maybe_list
    @profiles = current_user.maybe_profiles.includes(:stars, :maybes)
    render "profiles/index"
  end
  
  def nope_list
    @profiles = current_user.nope_profiles.includes(:stars, :maybes)
    render "profiles/index"
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
      @profile = @maybe.profile
      render "profiles/show", :status => 200
    else
      render :json => @maybe.errors.full_messages, :status => 422
    end
  end
  
  def destroy    
    maybe_params = { :profile_id => params[:profile_id], :user_id => current_user.id }
    @maybe = Maybe.find_by_ids(maybe_params)
    if @maybe.destroy
      render :json => params[:profile_id], :status => 200
    else
      render :json => @maybe.errrors.full_messages, :status => 422
    end
  end
  
end
