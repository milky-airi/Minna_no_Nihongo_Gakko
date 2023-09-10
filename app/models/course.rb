class Course < ApplicationRecord
  belongs_to :school

  validates :name, presence: true
  validates :admission_month, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 12 }
  validates :duration, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 24 }
end
