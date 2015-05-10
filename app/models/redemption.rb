class Redemption < ActiveRecord::Base
  belongs_to :user
  belongs_to :deal
  belongs_to :dispensary

  before_create :create_loyalty_program
  after_create :set_points

  validates_uniqueness_of :user_id, scope: :deal_id

  def set_points
    loyalty_program = user.loyalty_program_for(dispensary)
    bucket_value = (deal.price*4.20)
    PointBucket.create(user_id: user.id, loyalty_program_id: loyalty_program.id, value: bucket_value)
  end

  def create_loyalty_program
    user = self.user
    unless user.has_loyalty_program_for?(self.dispensary)
      user.create_loyalty_program_for(self.dispensary)
    end
  end

end
