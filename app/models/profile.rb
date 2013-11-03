class Profile < ActiveRecord::Base
  attr_accessible :username,
                  :gender, 
                  :about_me,
                  :friends_wanted,
                  :dating_wanted,
                  :hookups_wanted, 
                  :men_wanted,
                  :women_wanted,
                  :both_wanted,
                  :any_wanted,
                  :height, #integer in inches
                  :body_type,
                  :religion,
                  :education,
                  :children,
                  :pets
                  
  validates :username, :gender, :about_me, :presence => true
  validates :username, :uniqueness => true
                  
  belongs_to :user, :inverse_of => :profile
  
  has_many :maybes, :inverse_of => :profile
  has_many :nopes, :inverse_of => :profile
  has_many :stars, :inverse_of => :profile

end
