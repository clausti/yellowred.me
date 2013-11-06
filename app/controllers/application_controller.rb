class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper
  
  before_filter :must_be_logged_in
  
  def profile_booleans_false
    { "friends_wanted" => false,
      "dating_wanted" => false,
      "hookups_wanted" => false,
      "men_wanted" => false,
      "women_wanted" => false,
      "nonbinary_wanted" => false }
  end
  
end
