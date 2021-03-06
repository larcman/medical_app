require 'csv'

class Research < ApplicationRecord
  belongs_to :center
  belongs_to :user
  has_many :patients
  has_many :appointments
  has_many :evaluations
  
  validates :code, presence: true
  validates :name, presence: true
  validates :user_id, presence: true

  def self.to_csv(fields, records, options = {})
    # column_names = %w(code firstname day)
    CSV.generate(options) do |csv|
      csv << fields
      records.each do |record|
        csv << fields.map { |attr| record.public_send(attr) }
      end
    end
  end

end
