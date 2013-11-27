json.array!(@routes) do |route|
  json.extract! route, :route_id, :airport_origin, :airport_destination, :distance
  json.url route_url(route, format: :json)
end
