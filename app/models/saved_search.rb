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
    @profiles = Profile.includes(:stars, :maybes)
                       .where("user_id != #{self.user_id}")
                       .where( gender: interested_genders )
                       .where( self.looking_for )
  end
  
  private 
    def interested_genders
      genders = []
      genders << "male" if men_wanted
      genders << "female" if women_wanted
      genders += ["genderqueer", "nonbinary"] if nonbinary_wanted
      genders.empty? ? nil : genders
    end
  
    def looking_for
      looking = []
      looking << "friends_wanted = #{friends_wanted}" if friends_wanted
      looking << "dating_wanted = #{dating_wanted}" if dating_wanted
      looking << "hookups_wanted = #{hookups_wanted}" if hookups_wanted
      looking.join(" OR ")
    end
  
end
