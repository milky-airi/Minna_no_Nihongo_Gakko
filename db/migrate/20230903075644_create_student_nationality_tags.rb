class CreateStudentNationalityTags < ActiveRecord::Migration[6.1]
  def change
    create_table :student_nationality_tags do |t|
      t.string :nationality

      t.timestamps
    end
  end
end
