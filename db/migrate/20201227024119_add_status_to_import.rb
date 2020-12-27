class AddStatusToImport < ActiveRecord::Migration[6.0]
  def change
    add_column :imports, :status, :integer
  end
end
