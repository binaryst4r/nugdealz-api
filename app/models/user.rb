class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :dispensaries, through: :redemptions
  has_many :redemptions
  has_many :deals, through: :redemptions
  has_many :payments

  after_create :send_welcome_email

  def set_points(deal)
    value = (deal.price * 4.20).round(2)
    self.nugdealz_points += value
    self.save
  end

  def send_welcome_email
      UserMailer.signup_confirmation(self).deliver
  end

  def has_card?
    self.stripe_customer_token.present?
  end

  def current_card_brand
    if self.payments.present?
      self.payments.last.card_brand
    end
  end

  def current_card_last_4
    if self.payments.present?
      self.payments.last.card_last_4
    end
  end

  def favorite_dispensaries
    dispensaries.sort_by{|d| self.redemptions.where(dispensary_id: d.id).count}
  end

  def full_name
    "#{first_name} #{last_name}"
  end
  

end
