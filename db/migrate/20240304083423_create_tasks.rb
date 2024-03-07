class CreateTasks < ActiveRecord::Migration[7.1]
  def change
    create_table :tasks do |t|
      t.string :name
      t.integer :team_id
      t.integer :member_id
      t.string  :status
      t.text :memo
      t.datetime :start_date
      t.datetime :complate_date
      t.timestamps
    end
  end
end
