class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.text :address

      t.references :contact, null: false, index: true
      t.timestamps
    end
  end
end
