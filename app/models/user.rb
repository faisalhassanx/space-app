class User < ApplicationRecord
  attr_accessor :remember_token
  before_save { self.email = email.downcase }
  validates :name, presence: true,  length: { in: 4..50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { in: 4..255 }, 
                                    uniqueness: { case_sensitive: false }, 
                                    format: { with: VALID_EMAIL_REGEX }
  validates :password, :password_confirmation, presence: true, 
                                               length: { in: 6..25 }
                                    
  has_secure_password
  
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, const: cost)
  end
  
  # Returns a random token
  def User.new_token
    SecureRandom.urlsafe_base64
  end
  
  # Remembers a user in the database for use in persistent sessioins
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end
  
  # Returns true if the given token matches the digest
  def authenticated?(remember_token)
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end
end
