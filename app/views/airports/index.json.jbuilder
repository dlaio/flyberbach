json.array!(@airports) do |airport|
  json.extract! airport, :airport_code, :airport_name, :location_city, :country, :latitude, :longitude, :altitude, :timezone
  json.url airport_url(airport, format: :json)
end
