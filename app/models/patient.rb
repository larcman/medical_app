class Patient < ApplicationRecord
  belongs_to :center
  belongs_to :research
  belongs_to :person
end
