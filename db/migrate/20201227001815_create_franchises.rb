class CreateFranchises < ActiveRecord::Migration[6.0]
  def change
    create_table :franchises do |t|
      t.text :name
      t.text :start_numbers, array: true, default: []
      t.text :lengths, array: true, default: []

      t.timestamps
    end
  end
end
