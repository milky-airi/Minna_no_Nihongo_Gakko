# class ChangeDataOfReviewColumn < ActiveRecord::Migration[6.1]
#   def change
#     change_column :reviews, :star_integer, :float, null: false
#   end
# end


class ChangeDataOfReviewColumn < ActiveRecord::Migration[6.1]
  def up
    change_column :reviews, :star_integer, :float, null: false
  end

  def down
    change_column :reviews, :star_integer, :string, null: false
  end
end
