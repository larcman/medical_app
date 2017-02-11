class User < ApplicationRecord
  has_secure_password
  belongs_to :center
  has_many :researches
end
