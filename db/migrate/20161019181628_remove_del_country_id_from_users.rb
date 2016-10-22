class RemoveDelCountryIdFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :country_id
  end
end
