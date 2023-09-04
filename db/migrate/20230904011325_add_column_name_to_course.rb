class AddColumnNameToCourse < ActiveRecord::Migration[6.1]
  def change
    add_column :courses, :name, :string, null: false
  end
end
