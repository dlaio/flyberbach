json.array!(@flight_legs) do |flight_leg|
  json.extract! flight_leg, :leg_no, :flight_no, :route_id, :price
  json.url flight_leg_url(flight_leg, format: :json)
end
