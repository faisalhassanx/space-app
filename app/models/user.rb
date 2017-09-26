class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\-.]+\.[a-z]+\z/i
  
  before_save { self.email = email.downcase }
  validates :name, presence: true,  length: { in: 4..50 }
  validates :email, presence: true, length: { in: 4..255 }, 
                                    uniqueness: { case_sensitive: false }, 
                                    format: { with: VALID_EMAIL_REGEX }
  validates :password, :password_confirmation, presence: true, 
                                               length: { in: 6..25 }
                                    
  has_secure_password
end
