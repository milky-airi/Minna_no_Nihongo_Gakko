class RemoveColumnNationalityFromSchool < ActiveRecord::Migration[6.1]
  def change
    remove_column :schools, :student_nationality, :text
  end
end
