class SearchController < ApplicationController
  def index
  end

  def search
	@date = params[:start_date].to_date
	@prefecture_id = params[:prefecture_id].to_i
	
	if @prefecture_id == 0 then
		#都道府県==0 は指定無し→日付けのみ
		@events = Event.where("start_date >= ? AND start_date < ?", @date, @date + 1)
	else 
		#指定有り→都道府県コードも検索
		@events = Event.where("start_date >= ? AND start_date < ? AND prefecture_id = ?", @date, @date + 1, @prefecture_id)
	end
  end
end
