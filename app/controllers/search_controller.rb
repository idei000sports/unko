class SearchController < ApplicationController
  def index
	@q =Event.ransack()
	@prefecture = Prefecture.all
  end

  def search
	@date = params[:start_date].to_date
	@prefecture_id = params[:prefecture_id].to_i
	@search = Event.ransack(start_date_gteq: @date ,start_date_lteq_end_of_day: @date, prefecture_id_eq: @prefecture_id)
	@events = @search.result
  end

  def select
	date = params[:date].to_date
	@events = Event.where("start_date >= ? AND start_date < ?", date, date + 1)
	@date = params[:date].to_date
  end

end
