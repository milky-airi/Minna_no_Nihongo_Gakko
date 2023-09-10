class AddBuildingColumnToSchool < ActiveRecord::Migration[6.1]
  def change
    add_column :schools, :building, :string
  end
end
