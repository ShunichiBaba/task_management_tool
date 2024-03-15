class ChangeDataTypeForTask < ActiveRecord::Migration[7.1]
  def change
    rename_column :tasks, :status, :status_id
    change_column :tasks, :status_id, :integer
  end
end
