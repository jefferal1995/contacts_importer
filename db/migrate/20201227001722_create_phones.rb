class CreatePhones < ActiveRecord::Migration[6.0]
  def change
    create_table :phones do |t|
      t.text :number

      t.references :contact, null: false, index: true
      t.timestamps
    end
  end
end
