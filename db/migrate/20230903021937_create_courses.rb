class CreateCourses < ActiveRecord::Migration[6.1]
  def change
    create_table :courses do |t|
      t.references :school, null: false, foreign_key: true
      t.integer :admission_month, null: false
      t.integer :duration, null: false
      t.string :capacity, null: false
      t.text :condition
      t.timestamps
    end
  end
end
