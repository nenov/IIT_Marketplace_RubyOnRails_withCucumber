class IntervalsController < ApplicationController

  def new
    @interval = Interval.new
  end

  def create
  	@interval = Interval.new(params[:interval])
  	if @interval.start_hour*60+@interval.start_minute > @interval.end_hour*60+@interval.end_minute
  		@interval.start_hour = params[:interval][:end_hour]
  		@interval.start_minute = params[:interval][:end_minute]
  		@interval.end_hour = params[:interval][:start_hour]
  		@interval.end_minute = params[:interval][:start_minute]
  	end	
  	if @interval.save
  		redirect_to intervals_path(current_user)
  	else
  		render new_interval_path
  	end
  end

  def index
    @intervals = Interval.all
  end

  def show
    @interval = Interval.find(params[:id])
  end

  def edit
    @interval = Interval.find(params[:id])
  end

  def update
    @interval = Interval.find(params[:id])
    @interval.update_attributes(params[:interval])
    flash[:success] = "You just updated the Add!!!"
    redirect_to intervals_path
  end

end
