class Research < ApplicationRecord
  belongs_to :center
  belongs_to :user
  has_many :patients
  has_many :appointments
end
