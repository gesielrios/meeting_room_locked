class CreateLocks < ActiveRecord::Migration[6.1]
  def change
    create_table :locks do |t|
      t.integer :week_id
      t.integer :user_id
      t.integer :time_start
      t.integer :time_end
      t.integer :day_index
      t.timestamps
    end
  end
end
