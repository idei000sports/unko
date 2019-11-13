json.array! @evenps, partial: "evenps/evenp", as: :evenp

json.array!(@evenps) do |evenp|
  json.extract! evenp, :id, :title, :description   
  json.start evenp.start_date   
  json.end evenp.end_date   
  json.url evenp_url(evenp, format: :html) 
end