class AddDispensaryToredemption < ActiveRecord::Migration
  def change
    add_column :redemptions, :dispensary_id, :integer
  end
end
