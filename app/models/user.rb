class User < ApplicationRecord
  validates :name, presence: true, length: { in: 4..50 }
  validates :email, presence: true, length: { in: 4..255 }
end
