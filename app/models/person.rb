class Person < ApplicationRecord
  belongs_to :center
  has_many :patients
end
