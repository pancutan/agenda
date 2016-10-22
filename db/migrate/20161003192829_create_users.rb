class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :nombre
      t.string :apellido
      t.string :email
      t.boolean :activo
      t.integer :edad
      t.text :detalles

      t.timestamps
    end
  end
end
