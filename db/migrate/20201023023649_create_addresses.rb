class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :postal_code,        null: false
      t.integer :prefecuture_id,    null: false
      t.string :city,               null: false
      t.string :addresses,          null: false
      t.string :bulid_name
      t.integer :tel,               null: false
      t.references :purchase,       null: false, foreign_key: true
      t.timestamps
    end
  end
end
