class AddDefaultValueToReviews < ActiveRecord::Migration[6.1]
  def change
    change_column_default :reviews, :evaluation_class, from: nil, to: "3"
    change_column_default :reviews, :evaluation_after_graduation, from: nil, to: "3"
    change_column_default :reviews, :evaluation_place, from: nil, to: "3"
    change_column_default :reviews, :evaluation_facility, from: nil, to: "3"
    change_column_default :reviews, :evaluation_student, from: nil, to: "3"
    change_column_default :reviews, :evaluation_teacher, from: nil, to: "3"
    change_column_default :reviews, :comment_life, from: nil, to: "3"
  end
end
