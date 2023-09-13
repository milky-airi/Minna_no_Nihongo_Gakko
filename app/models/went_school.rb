class WentSchool < ApplicationRecord
  belongs_to :school
  belongs_to :user

  validates :graduate_year, format: { with: /\A\d{4}\z/ }, numericality: true
  validates :graduate_month, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 12 }
end
