class AddEnumToSchools < ActiveRecord::Migration[6.1]
  def change
    remove_column :schools, :prefecture, :string
    add_column :schools, :prefecture, :integer, null: false, default: 13
  end
end
