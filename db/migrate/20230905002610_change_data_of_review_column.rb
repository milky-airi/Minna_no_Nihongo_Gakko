class ChangeDataOfReviewColumn < ActiveRecord::Migration[6.1]
  def change
    change_column :reviews, :star_integer, :float, null: false
  end
end
