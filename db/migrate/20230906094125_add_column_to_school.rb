class AddColumnToSchool < ActiveRecord::Migration[6.1]
  def change
    add_column :schools, :latitude, :float
    add_column :schools, :longitude, :float
  end
end
