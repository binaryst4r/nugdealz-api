class Redemption < ActiveRecord::Base
  belongs_to :user
  belongs_to :deal
  belongs_to :dispensary
end
