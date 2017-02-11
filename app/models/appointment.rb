class Appointment < ApplicationRecord
  belongs_to :center
  belongs_to :patient
  belonts_to :research
end
