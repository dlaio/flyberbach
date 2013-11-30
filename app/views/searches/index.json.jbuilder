json.array!(@searches) do |search|
  json.extract! search, :departure_airport, :departure_time, :arrival_airport, :arrival_time
  json.url search_url(search, format: :json)
end
