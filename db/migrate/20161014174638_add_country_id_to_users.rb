class AddCountryIdToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :country_id, :integer
  end
end
