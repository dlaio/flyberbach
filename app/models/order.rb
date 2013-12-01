class Order < ActiveRecord::Base
	validates :user_id, presence: true
	belongs_to :user


	default_scope order: 'orders.created_at DESC' 
end
