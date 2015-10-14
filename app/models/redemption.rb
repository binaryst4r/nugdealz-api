class Redemption < ActiveRecord::Base
  belongs_to :user
  belongs_to :deal
  belongs_to :dispensary

  before_create :create_loyalty_program
  after_create :set_points
  after_create :send_confirmation_email

  # validates_uniqueness_of :user_id, scope: :deal_id

  def send_confirmation_email
    UserMailer.redemption_confirmation(self.user, self).deliver
  end

  def set_points

    ### DISPENSARY LOYALTY ##############################
    loyalty_program = user.loyalty_program_for(deal.dispensary)
    bucket_value = (deal.price.round(0))
    PointBucket.create(user_id: user.id, loyalty_program_id: loyalty_program.id, value: bucket_value)
    ######################################################

    ### NUGDEALZ LOYALTY ################################
    value = (deal.price * 4.20).round(2)
    user.nugdealz_points += value
    user.save
    #####################################################

  end

  def create_loyalty_program
    user = self.user
    unless user.has_loyalty_program_for?(self.dispensary)
      user.create_loyalty_program_for(self.dispensary)
    end
  end
  

end
