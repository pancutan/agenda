class CreatePhones < ActiveRecord::Migration[5.0]
  def change
    create_table :phones do |t|
      t.string :telefono
      t.integer :type_id
      t.integer :user_id

      t.timestamps
    end
  end
end
