class Center < ApplicationRecord
  has_many :users, dependent: :destroy
end
