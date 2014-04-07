class ModifyIntervalTable < ActiveRecord::Migration
  def change
    #rename_table :interval, :intervals
    change_column :intervals, :start_time, :time
    change_column :intervals, :end_time, :time
  end
end
