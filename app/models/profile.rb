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
                  :pets,
                  :profile_photo
                  
                  has_attached_file :profile_photo, :styles => {
                          :full => "400x400>",
                          :thumb => "80x80#"
                  }
                  
  GENDERS          = %w( male female genderqueer/nonbinary )
  HEIGHTS          = (58..84).to_a
  BODY_TYPES       = %w( skinny lean average pregnant athletic soft chubby heavy)
  RELIGIONS        = %w( none Jehovah Yaweh Allah Buddhist Hindu FSM other )
  EDUCATION_LEVELS = %w( some\ high\ school high\ school college masters PhD MD )
  CHILDREN_CHOICES = %w( have\ kids have\ kids\ &\ want\ more want\ kids don't\ want\ kids )
  PET_CHOICES      = %w( cats dogs ball\ pythons bearded\ dragons fish other )
  
  LISTS = %w( gender height body_type religion education children pets )
  
  before_save :nilify_blanks, :strip_about_me
  
  validates :user_id, 
            :presence   => true, 
            :uniqueness => true
            
  validates :username, 
            :on         => :update,
            :presence   => true, 
            :uniqueness => {:case_sensitive => false}          
            
  validates :gender, 
            :on => :update,
            :on        => :update,
            :inclusion => GENDERS
            
  validates :height,
            :on        => :update,
            :inclusion => HEIGHTS,
            :allow_blank => true
            
  validates :body_type,
            :on        => :update,  
            :inclusion => BODY_TYPES,
            :allow_blank => true
            
  validates :religion,
            :on        => :update,
            :inclusion => RELIGIONS,
            :allow_blank => true
            
  validates :education,
            :on        => :update,  
            :inclusion => EDUCATION_LEVELS,
            :allow_blank => true
            
  validates :children,
            :on        => :update,  
            :inclusion => CHILDREN_CHOICES,
            :allow_blank => true
            
  validates :pets,
            :on        => :update,  
            :inclusion => PET_CHOICES,
            :allow_blank => true
                
                  
  belongs_to :user, :inverse_of => :profile
  
  has_many :maybes, :inverse_of => :profile, :dependent => :delete_all
  has_many :stars, :inverse_of => :profile, :dependent => :delete_all
  
  has_many :starring_users, 
           :through => :stars, 
           :source => :user
           
  has_many :starring_profiles, 
           :through => :starring_users,
           :source => :profile
           
  def self.height_string(height_inches)
    hieght_feet_inches = height_inches.divmod(12)
    "#{hieght_feet_inches[0]}' #{hieght_feet_inches[1]}\""
  end
  
  def as_json(options = {})
    super(:except => [ :profile_photo_content_type, 
                       :profile_photo_file_name, 
                       :profile_photo_file_size, 
                       :profile_photo_updated_at ], 
          :methods => [:photo_url, :photo_thumb_url])
  end
  
  def photo_url
    self.profile_photo.url(:full)
  end
  
  def photo_thumb_url
    self.profile_photo.url(:thumb)
  end
           
  private
    def nilify_blanks
      Profile::LISTS.each do |list_name|
        self[list_name] = self[list_name].blank? ? nil : self[list_name]
      end
    end
  
    def strip_about_me
      self.about_me.strip! if self.about_me
    end
end
