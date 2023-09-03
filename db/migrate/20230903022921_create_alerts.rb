class CreateAlerts < ActiveRecord::Migration[6.1]
  def change
    create_table :alerts do |t|
      t.references :review, null: false, foreign_key: true

      t.text :reason, null: false
      t.boolean :is_done, null: false, default: false
      t.timestamps
    end
  end
end
