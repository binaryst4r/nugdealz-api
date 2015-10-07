class Redemption < ActiveRecord::Base
  belongs_to :user
  belongs_to :deal
  belongs_to :dispensary

  after_create :set_points
  after_create :send_confirmation_email

  # validates_uniqueness_of :user_id, scope: :deal_id

  def send_confirmation_email
    UserMailer.redemption_confirmation(self.user, self).deliver
  end

  def set_points
    deal = self.deal
    user.set_points(deal)   
  end
  

end
