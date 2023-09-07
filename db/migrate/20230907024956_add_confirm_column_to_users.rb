class AddConfirmColumnToUsers < ActiveRecord::Migration[6.1]
  def change
    # add_column :users, :confirmation_status, :integer, default: 1, null: false
    # add_column :users, :confirmation_token, :string, limit: 64
    # add_column :users, :expiration_date, :datetime

    add_column :users, :confirmation_token, :string
    add_column :users, :confirmed_at, :datetime
    add_column :users, :confirmation_sent_at, :datetime
    add_column :users, :unconfirmed_email, :string
  end
end
