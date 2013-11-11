class Star < ActiveRecord::Base
  attr_accessible :profile_id, :user_id
  
  validates :profile_id, :user_id, :presence => true
  validates_uniqueness_of :profile_id, :scope => [:user_id]
  validate :cant_star_self
  
  belongs_to :user, :inverse_of => :stars
  belongs_to :profile, :inverse_of => :stars, :counter_cache => true
  
  def cant_star_self
    if profile_id == user_id
      errors.add(:profile_id, "can't be your own profile")
    end
  end
end
