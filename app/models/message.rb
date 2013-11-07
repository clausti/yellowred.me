class Message < ActiveRecord::Base
  attr_accessible :title, :body, :recipient_id, :sender_id
  
  validates :sender_id, :recipient_id, :body, :title, :presence => true
  
  belongs_to :sender, 
             :class_name => "User",
             :foreign_key => :sender_id,
             :inverse_of => :messages_sent
             
  belongs_to :recipient, 
             :class_name => "User",
             :foreign_key => :recipient_id,
             :inverse_of => :messages_recd
             
             
end
