module ApplicationHelper
	def page_title
		#サイトのタイトル
		title = "スケジュール"
		title = title + " | " + @page_title if @page_title
		title
	end
end
