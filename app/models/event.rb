class Event < ApplicationRecord
	has_many :event_performers
	has_many :images
end
