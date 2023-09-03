class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.references :user, null: false, foreign_key: true
      t.references :school, null: false, foreign_key: true

      t.string :star_integer, null: false
      t.text :comment_integer
      t.integer :evaluation_class, null: false
      t.text :comment_class
      t.integer :evaluation_after_graduation, null: false
      t.text :comment_after_graduation
      t.integer :evaluation_place, null: false
      t.text :comment_place
      t.integer :evaluation_facility, null: false
      t.text :comment_facility
      t.integer :evaluation_student, null: false
      t.text :comment_student
      t.integer :evaluation_teacher, null: false
      t.text :comment_teacher
      t.integer :evaluation_life, null: false
      t.text :comment_life

      t.timestamps
    end
  end
end
