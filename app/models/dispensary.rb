class Dispensary < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  scope :recreational, -> {where(recreational: true)}
 	scope :medical, -> {where(medical: true)}

  has_many :deals
  has_many :redemptions
  has_many :loyalty_programs

  geocoded_by :zip
  after_validation :geocode

  def reduce_quantity_for(deal)
    deal.quantity_available -= 1
    deal.save
  end


end
