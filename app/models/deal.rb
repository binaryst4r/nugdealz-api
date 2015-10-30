class Deal < ActiveRecord::Base
	belongs_to :dispensary
	has_many :redemptions
  has_many :payments


	scope :recreational, -> {where(recreational: true)}
  scope :medical, -> {where(medical: true)}
	scope :active, -> {where(active: true)}

	def point_value
		(price * 4.20).round(2)
	end



end
