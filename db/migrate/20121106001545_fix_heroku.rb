class FixHeroku < ActiveRecord::Migration
  def change
    remove_column :intervals, :start_time;
    remove_column :intervals, :end_time;
    add_column :intervals, :start_time, :time
    add_column :intervals, :end_time, :time
  end
end
