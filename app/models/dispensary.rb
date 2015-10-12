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

  before_save :link_leafly, if: :leafly_slug_changed?
  geocoded_by :full_address
  after_validation :geocode

  def link_leafly
    app_id = "b42999e4"
    app_key = "1c49dab735a206ea5f16c78dd6c53c65"
    slug = self.leafly_slug
    leafly_dispensary = HTTParty.get("http://data.leafly.com/locations/#{slug}", {headers:{"app_id" => app_id, "app_key" => app_key}})
    self.logo = leafly_dispensary["logo"]
    cover_image = leafly_dispensary["coverPhoto"]
    
  end

  def full_address
    "#{address1}, #{city}, #{state} #{zip}"
  end

  def recreational_or_medical
    if !self.medical.present? && !self.recreational.present?
      redirect_to :back, notice: 'You must select recreational or medical.'
    end
  end

  def complete_order_for(deal)
    deal.quantity_available -= 1
    deal.save
    self.balance += (deal.price*0.5)
    self.save
  end

  def available_deals
    deals.where('quantity_available > 0')
  end

  def top_deals
    available_deals.sort_by{|x| x.redemptions.count}.first(5)
  end


end
