class Star < ActiveRecord::Base
  attr_accessible :profile_id, :user_id
  
  validates :profile_id, :user_id, :presence => true
  validates_uniqueness_of :profile_id, :scope => [:user_id]
  
  belongs_to :user, :inverse_of => :maybes
  belongs_to :profile, :inverse_of => :maybes
end
