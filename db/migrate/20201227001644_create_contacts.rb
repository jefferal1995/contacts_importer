class CreateContacts < ActiveRecord::Migration[6.0]
  def change
    create_table :contacts do |t|
      t.text :name
      t.date :birth_date
      t.text :email

      t.references :user, null: false, index: true
      t.timestamps
    end
  end
end
