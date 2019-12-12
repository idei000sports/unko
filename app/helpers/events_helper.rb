module EventsHelper

	def share_twitter
		share_twitter = @share_twitter.start_date.to_s(:date_jp) + "\n"
		share_twitter +=  @share_twitter.event_title + "\n"
		share_twitter += @share_twitter.event_venue
		share_twitter += @share_prefecture_name + "\n"
		share_twitter += "\n"

		@share_twitter.event_performers.each do |performer|
			share_twitter += performer.performer_name + "\n"
		end

		share_twitter += "\n"
		share_twitter += "Open/Start\s"
		share_twitter += @share_twitter.open_date.to_s(:only_time) + "/"
		share_twitter += @share_twitter.start_date.to_s(:only_time)
		share_twitter += "\n"
		share_twitter += "Adv/Door\s"
		share_twitter += @share_twitter.event_adv.to_s
		share_twitter += "円"
		share_twitter += "/"
		share_twitter += @share_twitter.event_door.to_s
		share_twitter += "円"
		share_twitter
	end
end
