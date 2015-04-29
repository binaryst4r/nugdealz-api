class Deal < ActiveRecord::Base
	belongs_to :dispensary

	def point_value
		in_store_price / 10	
	end

end
