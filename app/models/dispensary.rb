class Dispensary < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :name, :address1, :city, :state, :zip

  validate :recreational_or_medical

  scope :recreational, -> {where(recreational: true)}
 	scope :medical, -> {where(medical: true)}

  has_many :deals, dependent: :destroy
  has_many :redemptions, dependent: :destroy
  has_many :loyalty_programs, dependent: :destroy

  geocoded_by :zip
  after_validation :geocode

  def recreational_or_medical
    if !self.medical.present? && !self.recreational.present?
      redirect_to :back, notice: 'You must select recreational or medical.'
    end
  end

  def reduce_quantity_for(deal)
    deal.quantity_available -= 1
    deal.save
  end

  def available_deals
    deals.where('quantity_available > 0')
  end


end
