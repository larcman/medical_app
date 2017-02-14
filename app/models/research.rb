class Research < ApplicationRecord
  belongs_to :center
  belongs_to :user
  has_many :patients
  has_many :appointments
  
  validates :code, presence: true
  validates :name, presence: true
  validates :user_id, presence: true
end
