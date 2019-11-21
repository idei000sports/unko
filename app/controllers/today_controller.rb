class TodayController < ApplicationController
  def index
	prefecture_id = params[:prefecture_id].to_i

	if prefecture_id == 0 then
		@id = '/events.json'

	elsif 1 <=  prefecture_id && prefecture_id <= 47 then
		@id = '/prefecture/' + params[:prefecture_id] + '.json'
	end
  end

  def select
	date = params[:date].to_date
	@events = Event.where("start_date >= ? AND start_date < ?", date, date + 1)
	@date = params[:date].to_date
  end
end
