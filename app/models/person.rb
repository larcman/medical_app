class Person < ApplicationRecord
  belongs_to :center
  has_many :patients
  
  validates :code, presence: true
  validates :elaborationdate, presence: true
  validates :firstname, presence: true
  validates :lastname, presence: true
  
  def identifier
    @identifier = firstname + " " + lastname + " (" + code + ")"
  end
end
