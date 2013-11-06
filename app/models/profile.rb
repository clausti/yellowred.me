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
                  
  GENDERS          = %w( male female genderqueer/nonbinary )
  HEIGHTS          = (58..84).to_a
  BODY_TYPES       = %w( skinny lean average athletic soft chubby heavy)
  RELIGIONS        = %w( none Jehovah Yaweh Allah Buddhist Hindu FSM other )
  EDUCATION_LEVELS = %w( some\ high\ school high\ school college masters PhD MD )
  CHILDREN_CHOICES = %w( have\ kids have\ kids\ &\ want\ more want\ kids don't\ want\ kids )
  PET_CHOICES      = %w( cats dogs ball\ pythons bearded\ dragons fish other )

  validates :user_id, 
            :presence   => true, 
            :uniqueness => true
            
  validates :username, 
            :on         => :update,
            :presence   => true, 
            :uniqueness => {:case_sensitive => false}          
            
  validates :gender, 
            :on        => :update,
            :inclusion => GENDERS
            
  validates :height,
            :inclusion => HEIGHTS
            
  validates :body_type,
            :inclusion => BODY_TYPES
            
  validates :religion,
            :inclusion => RELIGIONS
            
  validates :education,
            :inclusion => EDUCATION_LEVELS
            
  validates :children,
            :inclusion => CHILDREN_CHOICES
            
  validates :pets,
            :inclusion => PET_CHOICES
                
                  
  belongs_to :user, :inverse_of => :profile
  
  has_many :maybes, :inverse_of => :profile
  has_many :nopes, :inverse_of => :profile
  has_many :stars, :inverse_of => :profile
  
  has_many :starring_users, 
           :through => :stars, 
           :source => :user
  

end
