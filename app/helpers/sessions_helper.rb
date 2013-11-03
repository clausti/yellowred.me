module SessionsHelper
  
  def must_be_logged_in
    if current_user.nil?
      redirect_to new_session_url
    end
  end
  
  def current_user
    @current_user ||= User.find_by_session_token(session[:token])
  end

  def login_user!
    @user.reset_session_token
    @user.save
    session[:token] = @user.session_token
  end

  def logout_user!
    @user.reset_session_token
    @user.save
    session[:token] = nil
  end
  
end
