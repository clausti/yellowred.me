class SavedSearch < ActiveRecord::Base
  attr_accessible :user_id,
                  :username,
                  :gender, 
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
                  
  validates :user_id, :presence => true, :uniqueness => true
                  
  belongs_to :user, :inverse_of => :saved_search
end
