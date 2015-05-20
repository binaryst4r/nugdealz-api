class Deal < ActiveRecord::Base
	belongs_to :dispensary
	has_many :redemptions
  has_many :payments


	scope :recreational, -> {where(recreational: true)}
	scope :medical, -> {where(medical: true)}

	def point_value
		(price * 4.20).round(0)
	end



end
