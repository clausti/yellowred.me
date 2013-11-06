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

  validates :user_id, 
            :presence   => true, 
            :uniqueness => true
            
  validates :username, 
            :on         => :update,
            :presence   => true, 
            :uniqueness => {:case_sensitive => false}          
            
  validates :gender, 
            :on        => :update,
            :inclusion => %w( male female genderqueer/nonbinary )
            
  validates :height,
            :inclusion => { :in => 58..84 }
            
  validates :body_type,
            :inclusion => %w( skinny lean average athletic soft chubby heavy)
            
  validates :religion,
            :inclusion => %w( none Jehovah Yaweh Allah Buddhist Hindu FSM other )
            
  validates :education,
            :inclusion => %w( some\ high\ school high\ school college masters PhD MD )
            
  validates :children,
            :inclusion => %w( have\ kids have\ kids\ &\ want\ more want\ kids don't\ want\ kids )
            
  validates :pets,
            :inclusion => %w( cats dogs ball\ pythons bearded\ dragons fish other )
                
                  
  belongs_to :user, :inverse_of => :profile
  
  has_many :maybes, :inverse_of => :profile
  has_many :nopes, :inverse_of => :profile
  has_many :stars, :inverse_of => :profile

end
