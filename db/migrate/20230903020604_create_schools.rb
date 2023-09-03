class CreateSchools < ActiveRecord::Migration[6.1]
  def change
    create_table :schools do |t|
      t.string :school_name, null: false
      t.string :school_name_kana, null: false
      t.string :school_name_en, null: false
      t.text :summary, null: false
      t.string :station, null: false
      t.string :prefecture, null: false
      t.text :address, null: false
      t.text :hp
      t.text :facebook
      t.text :twitter
      t.text :instagram
      t.text :tiktok
      t.text :youtube
      t.text :condition
      t.integer :anual_fee
      t.text :student_nationality
      t.boolean :have_dormitory, default: false
      t.integer :dormitory_fee
      t.boolean :is_open,  null: false, default: true

      t.timestamps
    end
  end
end
