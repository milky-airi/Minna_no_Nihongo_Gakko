class RemoveColumnFromUser < ActiveRecord::Migration[6.1]
  def change
    # remove_column :users, :school_id, :integer
    remove_column :users, :graduated_at, :integer
  end
end
