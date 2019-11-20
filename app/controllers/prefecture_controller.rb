class PrefectureController < ApplicationController

  def show
	@eventsyo = Event.where("prefecture_id = ?",params[:id])
	@events = Event.where("prefecture_id = ?",params[:prefecture_id])
  end

end
