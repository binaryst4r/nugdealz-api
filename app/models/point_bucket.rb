class PointBucket < ActiveRecord::Base
  belongs_to :user
  belongs_to :loyalty_program

end
