class AddColumnToReview < ActiveRecord::Migration[6.1]
  def change
    add_column :reviews, :is_open, :boolean, null: false, default: true
    add_column :comments, :is_open, :boolean, null: false, default: true
  end
end
