class AddUserIdToImport < ActiveRecord::Migration[6.0]
  def change
    add_reference :imports, :user, null: false, foreign_key: true
  end
end
