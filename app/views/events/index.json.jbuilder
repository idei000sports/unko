json.array! @events, partial: "events/event", as: :event

json.array!(@events) do |event|

  json.id event.id   
  json.title event.event_title   
  json.description event.event_description   
  json.start event.start_date   
  json.end event.end_date   
  json.url event_url(event, format: :html) 
end