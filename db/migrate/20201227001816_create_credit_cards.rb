class CreateCreditCards < ActiveRecord::Migration[6.0]
  def change
    create_table :credit_cards do |t|
      t.text :encrypted_number
      t.text :last_four_numbers

      t.references :contact, null: false, index: true
      t.references :franchise, null: false, index: true
      t.timestamps
    end
  end
end
