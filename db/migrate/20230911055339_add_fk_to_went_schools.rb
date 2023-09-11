class AddFkToWentSchools < ActiveRecord::Migration[6.1]
  def change

    add_column :reviews, :went_school_id, :integer
    remove_column :reviews, :user_id, :integer

  end
end
