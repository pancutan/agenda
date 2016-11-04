class AddemailAndPasswordToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :password_digest, :string
    add_column :users, :admin, :boolean
  end
end
