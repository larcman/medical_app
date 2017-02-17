class Appointment < ApplicationRecord
  belongs_to :center
  belongs_to :patient
  belongs_to :research
  has_one :evaluation, dependent: :destroy
end
