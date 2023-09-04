class CreateWentSchools < ActiveRecord::Migration[6.1]
  def change
    create_table :went_schools do |t|
      t.integer :graduate_at
      t.references :school, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
