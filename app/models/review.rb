class Review < ApplicationRecord
  belongs_to :user
  belongs_to :school
  has_many :alerts, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :star_integer, presence: :true
  validates :evaluation_class, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
  validates :evaluation_after_graduation, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
  validates :evaluation_place, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
  validates :evaluation_facility, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
  validates :evaluation_student, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
  validates :evaluation_teacher, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
  validates :evaluation_life, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
end
