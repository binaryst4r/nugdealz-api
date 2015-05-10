class LoyaltyProgram < ActiveRecord::Base
  belongs_to :dispensary
  belongs_to :user
  has_many :point_buckets

  validates_uniqueness_of :user_id, scope: :dispensary_id

  def total_points
    point_buckets.sum(:value)
  end

end
