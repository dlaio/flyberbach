json.array!(@flights) do |flight|
  json.extract! flight, :airline, :flight_no, :plane_type, :leave_time, :leave_city, :arrive_time, :arrive_city, :remark, :created_at, :updated_at, :price, :cabin_class
  json.url flight_url(flight, format: :json)
end
