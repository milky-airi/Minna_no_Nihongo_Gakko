class ChangeColumnOf < ActiveRecord::Migration[6.1]
  def change

    remove_column :went_schools, :graduate_at, :integer
    add_column :went_schools, :graduate_year, :integer
    add_column :went_schools, :graduate_month, :integer

  end
end
