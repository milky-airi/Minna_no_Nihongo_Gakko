class StudentNationalityTag < ApplicationRecord
  has_many :student_nationality_taggings, dependent: :destroy
  has_many :schools, through: :student_nationality_taggings
end
