class AddCountryCodeToMembers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :country_code, :string, default: "JP"
    remove_column :users, :nationality, :string
  end
end
