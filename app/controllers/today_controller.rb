class TodayController < ApplicationController
  def index
	@todays = Event.all
	@msg = "mang"
  end

  def select
	date = params[:date].to_date
	@events = Event.where("start_date >= ? AND start_date < ?", date, date + 1)
	@date = date
  end
end
