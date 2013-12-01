class LineItem < ActiveRecord::Base
	belongs_to :flight
	belongs_to :cart

	def full_price
    	return flight.price
  	end
end
