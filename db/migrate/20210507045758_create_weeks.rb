class CreateWeeks < ActiveRecord::Migration[6.1]
  def change
    create_table :weeks do |t|
      t.datetime :beginning
      t.datetime :end
      t.timestamps
    end
  end
end
