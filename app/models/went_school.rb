class WentSchool < ApplicationRecord
  belongs_to :school
  belongs_to :user
  has_one :review, dependent: :destroy

  validates :graduate_year, length: { is: 4 }
  validates :graduate_month, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 12 }
end
