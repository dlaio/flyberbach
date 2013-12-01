namespace :db do 
	desc "Fill database with sample data" 
	task populate: :environment do
		users = User.all( limit: 6) 
		50. times do 
			note = Faker::Lorem.sentence( 5)
			price = Faker::Number.number(4) 
			users.each { | user | user.orders.create!( notes: note, price: price) } 
		end 
	end 
end