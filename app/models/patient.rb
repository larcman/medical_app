class Patient < ApplicationRecord
  belongs_to :center
  belongs_to :research
  belongs_to :person
  has_many :appointments, dependent: :destroy
  
  validates :code, presence: true
  validates :research_id, presence: true
  validates :person_id, presence: true
end
