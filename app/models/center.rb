class Center < ApplicationRecord
  has_many :users, dependent: :destroy
  has_many :researches, dependent: :destroy
  has_many :people, dependent: :destroy
  has_many :patients, dependent: :destroy
end
