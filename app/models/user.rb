class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :loyalty_programs, dependent: :destroy
  has_many :dispensaries, through: :loyalty_programs
  has_many :redemptions

  after_create :send_welcome_email

  def send_welcome_email
      UserMailer.signup_confirmation(self).deliver
  end

  def favorite_dispensaries
    dispensaries.sort_by{|d| loyalty_points_for(d)}.reverse
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def point_progress_for(dispensary)
    total_points = loyalty_points_for(dispensary)

    percent = total_points / 100
    return percent *100
  end

  def loyalty_points_for(dispensary)
    loyalty_program_for(dispensary).try(:total_points) || 0
  end

  def loyalty_program_for(dispensary)
    self.loyalty_programs.find_by(dispensary_id: dispensary.id)
  end

  def has_loyalty_program_for?(dispensary)
    self.loyalty_programs.where(:dispensary_id => dispensary.id).present?
  end

  def create_loyalty_program_for(dispensary)
    LoyaltyProgram.create(dispensary_id: dispensary.id, user_id: self.id)
  end

end
