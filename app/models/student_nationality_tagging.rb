class StudentNationalityTagging < ApplicationRecord
  belongs_to :school
  belongs_to :student_nationality_tag
end
