class AddStredeemedToRedemption < ActiveRecord::Migration
  def change
    add_column :redemptions, :redeemed, :boolean, default: false
  end
end
