class CreateNiceReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :nice_reviews do |t|
      t.references :review, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
