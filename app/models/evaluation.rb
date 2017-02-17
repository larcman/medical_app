class Evaluation < ApplicationRecord
  belongs_to :center
  belongs_to :appointment
  belongs_to :research
end
