class Center < ApplicationRecord
  has_many :users, dependent: :destroy
  has_many :researches
end
