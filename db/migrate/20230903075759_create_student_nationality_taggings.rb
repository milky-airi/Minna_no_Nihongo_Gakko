class CreateStudentNationalityTaggings < ActiveRecord::Migration[6.1]
  def change
    create_table :student_nationality_taggings do |t|
      t.references :school, null: false, foreign_key: true
      t.references :student_nationality_tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
