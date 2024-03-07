class RenameComplateDateColumnToTasks < ActiveRecord::Migration[7.1]
  def change
    rename_column :tasks, :complate_date, :complete_date
  end
end
