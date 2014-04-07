class Interval < ActiveRecord::Base

  belongs_to :user
	attr_accessible :day, :start_hour, :start_minute, :end_hour, :end_minute, :user_id

end
