class Maybe < ActiveRecord::Base
  attr_accessible :profile_id, :user_id, :prefer
  
  validates :profile_id, :user_id, :presence => true
  validates_uniqueness_of :profile_id, :scope => [:user_id]
  
  belongs_to :user, :inverse_of => :maybes
  belongs_to :profile, :inverse_of => :maybes
  
  def self.find_by_ids(params_hash)
    user_id = params_hash[:user_id]
    profile_id = params_hash[:profile_id]
    Maybe.find_by_user_id_and_profile_id(user_id, profile_id)
  end
  
end
