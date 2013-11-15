require 'bcrypt'

class User < ActiveRecord::Base
  attr_accessible :email, :password, :session_token
  
  before_validation(:on => :create) do
    self.reset_session_token
  end
  
  validates :email, :password_digest, :session_token, :presence => true
  validates :email, :uniqueness => {:case_sensitive => false}
  validates :password, :length => { :minimum => 6, :allow_nil => true }
  
  has_one :profile, :inverse_of => :user, :dependent => :delete
  has_one :saved_search, :inverse_of => :user, :dependent => :delete
  
  has_many :messages_sent, 
           :class_name => "Message",
           :foreign_key => :sender_id,
           :inverse_of => :sender,
           :dependent => :delete_all
           
  has_many :messages_recd, 
           :class_name => "Message",
           :foreign_key => :recipient_id,
           :inverse_of => :recipient,
           :dependent => :delete_all
           
  has_many :maybes, :inverse_of => :user, :dependent => :delete_all
  
  has_many :all_maybe_profiles,
           :through => :maybes,
           :source => :profile
  
  has_many :stars, :inverse_of => :user, :dependent => :delete_all

  has_many :starred_profiles,
           :through => :stars,
           :source => :profile
                      
  has_many :starring_profiles, 
           :through => :profile,
           :source => :starring_profiles
           
  
  def self.find_by_credentials(user_hash)
    @user = User.find_by_email(user_hash[:email])
    
    if @user && @user.has_password?(user_hash[:password])
      @user
    else
      nil
    end
  end
  
  def self.find_by_username(username)
    Profile.find_by_username(username).user
  end
  
  def password=(raw_pw) 
    @password = raw_pw
    self.password_digest = BCrypt::Password.create(raw_pw)
  end
  
  def password
    @password
  end
  
  def has_password?(tent_pw)
    BCrypt::Password.new(self.password_digest) == tent_pw
  end
  
  def reset_session_token
    self.session_token = SecureRandom::urlsafe_base64(16)
  end
  
  def messages
    self.messages_sent + self.messages_recd
  end
  
  def maybe_profiles
    self.all_maybe_profiles.where("prefer = true")
  end
  
  def nope_profiles
    self.all_maybe_profiles.where("prefer = false")
  end
  
end
