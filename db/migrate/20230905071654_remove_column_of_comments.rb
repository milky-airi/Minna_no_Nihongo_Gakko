class RemoveColumnOfComments < ActiveRecord::Migration[6.1]
  def change
    remove_column :comments, :is_open, :boolean
  end
end
