class Profile < ActiveRecord::Base
  attr_accessible :user_id,
                  :username,
                  :gender, 
                  :about_me,
                  :friends_wanted,
                  :dating_wanted,
                  :hookups_wanted, 
                  :men_wanted,
                  :women_wanted,
                  :nonbinary_wanted,
                  :height, #integer in inches
                  :body_type,
                  :religion,
                  :education,
                  :children,
                  :pets

  validates :user_id, :presence => true, :uniqueness => true
  validates :gender, :presence => true, :on => :update
  validates :username, :presence => true, 
                       :uniqueness => {:case_sensitive => false},
                       :on => :update               
                  
  belongs_to :user, :inverse_of => :profile
  
  has_many :maybes, :inverse_of => :profile
  has_many :nopes, :inverse_of => :profile
  has_many :stars, :inverse_of => :profile

end
