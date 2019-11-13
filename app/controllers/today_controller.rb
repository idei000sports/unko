class TodayController < ApplicationController
  def index
	@todays = Event.all
	@msg = "mang"
  end
end
