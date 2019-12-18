class SearchController < ApplicationController

  def index
	@q =Event.ransack()
	@prefecture = Prefecture.all
  end

  def select
	@date = params[:start_date].to_date
	@prefecture_id = params[:prefecture_id].to_i
	
	if @prefecture_id == 0 then
		search = Event.ransack(start_date_gteq: @date ,start_date_lteq_end_of_day: @date)
	else 
		search = Event.ransack(start_date_gteq: @date ,start_date_lteq_end_of_day: @date, prefecture_id_eq: @prefecture_id)
	end
	events = search.result.includes(:images, :prefecture, :event_performers)
	@events = events.page(params[:page]).per(10)
  end




end
