class Message < ActiveRecord::Base
  attr_accessible :body, :recipient_id, :sender_id
  
  validates :sender_id, :recipient_id, :body, :presence => true
  validates :body, :length => { :maximum => 1200 }
  validate :cant_message_self
 
  belongs_to :sender, 
             :class_name => "User",
             :foreign_key => :sender_id,
             :inverse_of => :messages_sent
             
  belongs_to :recipient, 
             :class_name => "User",
             :foreign_key => :recipient_id,
             :inverse_of => :messages_recd
  
  def timestamp
    self.created_at.strftime('%d %b %Y, %I:%M %p')
  end
    
  private
    def cant_message_self
      if sender_id == recipient_id
        errors.add(:profile_id, "can't message yourself")
      end
    end       
end
