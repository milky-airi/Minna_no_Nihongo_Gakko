class RemoveKanaColumnFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :name_kana, :string
  end
end
