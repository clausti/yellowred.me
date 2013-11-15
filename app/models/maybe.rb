class Maybe < ActiveRecord::Base
  attr_accessible :profile_id, :user_id, :prefer
  
  validates :profile_id, :user_id, :presence => true
  validates_uniqueness_of :profile_id, :scope => [:user_id]
  validate :cant_maybe_self
  
  belongs_to :user, 
             :inverse_of => :maybes,
             :include => :profile
  
  belongs_to :profile, :inverse_of => :maybes
  
  def self.find_by_ids(maybe_hash)
    user_id = maybe_hash[:user_id]
    profile_id = maybe_hash[:profile_id]
    Maybe.find_by_user_id_and_profile_id(user_id, profile_id)
  end
  
  def cant_maybe_self
    if profile_id == user_id
      errors.add(:profile_id, "can't be your own profile")
    end
  end
  
end
