class PrefectureController < ApplicationController
  def index

	prefecture_id = params[:prefecture_id].to_i

	if prefecture_id == 0 then
		@id = '/prefecture/' + 1.to_s + '.json'

	elsif 1 <=  prefecture_id && prefecture_id <= 47 then
		@id = '/prefecture/' + params[:prefecture_id] + '.json'
	end


  end

  def show
	
	@eventsyo = Event.where("prefecture_id = ?",params[:id])
	@events = Event.where("prefecture_id = ?",params[:prefecture_id])
  end

  def test
	@events = Event.where("prefecture_id = ?",params[:prefecture_id])
	render :json => @events
  end
end
