class CreateIntervals < ActiveRecord::Migration
  def change
    create_table :intervals do |t|
      t.string :day
      t.date :start_time
      t.date :end_time
      t.timestamps
    end
  end
end
