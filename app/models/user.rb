class User < ApplicationRecord
  has_secure_password
  belongs_to :center
  has_many :researches
  
  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :username, presence: true
  validates :email, presence: true
  validates :password_digest, presence: true
end
