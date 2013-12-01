class Search < ActiveRecord::Base

def flights
  @flights ||= find_flights
end

private

def find_flights
  Flight.find(:all, :conditions => conditions)
end


def departure_date_conditions
  ["flights.leave_time >= ?", departure_time] unless departure_time.blank?
end

def departure_airport_conditions
  ["flights.leave_city == ?", departure_airport] unless departure_airport.blank?
end

def departure_airport_conditions
  ["flights.arrive_city == ?", arrival_airport] unless arrival_airport.blank?
end

def arrival_date_conditions
  ["flights.arrive_time <= ?", arrival_time] unless arrival_time.blank?
end

def conditions
  [conditions_clauses.join(' AND '), *conditions_options]
end

def conditions_clauses
  conditions_parts.map { |condition| condition.first }
end

def conditions_options
  conditions_parts.map { |condition| condition[1..-1] }.flatten
end

def conditions_parts
  private_methods(false).grep(/_conditions$/).map { |m| send(m) }.compact
end


end
