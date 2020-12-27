class CreateLogs < ActiveRecord::Migration[6.0]
  def change
    create_table :logs do |t|
      t.text :message

      t.references :import, null: false, index: true
      t.timestamps
    end
  end
end
