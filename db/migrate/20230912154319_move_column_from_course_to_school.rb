class MoveColumnFromCourseToSchool < ActiveRecord::Migration[6.1]
  def change
    remove_column :courses, :capacity, :integer
    add_column :schools, :capacity, :integer
  end
end
