require 'bcrypt'

class User < ActiveRecord::Base
  attr_accessible :email, :password, :session_token
  
  validates :email, :password_digest, :session_token, :presence => true
  validates :email, :uniqueness => true
  validates :password, :length => { :minimum => 6, :allow_nil => true }
  
  has_one :profile, :inverse_of => :user
  
  has_many :messages_sent, 
           :class_name => "Message",
           :foreign_key => :sender_id,
           :inverse_of => :sender
           
  has_many :messages_recd, 
           :class_name => "Message",
           :foreign_key => :recipient_id,
           :inverse_of => :recipient
           
  has_many :maybes, :inverse_of => :user
  has_many :nopes, :inverse_of => :user
  has_many :stars, :inverse_of => :user
  
  
  
  
end
