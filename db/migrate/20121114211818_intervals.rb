class Intervals < ActiveRecord::Migration
  def change
  	add_column :intervals, :start_hour, :integer
  	add_column :intervals, :start_minute, :integer
  	add_column :intervals, :end_hour, :integer
  	add_column :intervals, :end_minute, :integer

  	remove_column :intervals, :start_time
    remove_column :intervals, :end_time
  end
end
