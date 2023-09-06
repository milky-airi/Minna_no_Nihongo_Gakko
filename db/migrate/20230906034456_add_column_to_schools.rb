class AddColumnToSchools < ActiveRecord::Migration[6.1]
  def change
    add_column :schools, :image_from, :text
  end
end
