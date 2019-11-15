json.extract! event, :id, :event_title, :event_venue, :event_description, :user_id, :start_date, :end_date, :event_adv, :event_door, :created_at, :updated_at
json.url event_url(event, format: :json)
