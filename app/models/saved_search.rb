class SavedSearch < ActiveRecord::Base
  attr_accessible :user_id,
                  :username,
                  :gender, 
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
                  
  belongs_to :user, :inverse_of => :saved_search
  
  def find_matches
    # performs single query to locate profiles that match the given parameters
    # returns them, including stars, maybes
    
    @profiles = Profile.includes(:stars, :maybes)
                       .where("user_id != #{self.user_id}")
                       .where( gender: interested_genders )
  end
  
  def interested_genders
    genders = []
    genders << "male" if men_wanted
    genders << "female" if women_wanted
    genders += ["genderqueer", "nonbinary"] if nonbinary_wanted
    genders.empty? ? nil : genders
  end
  
end
