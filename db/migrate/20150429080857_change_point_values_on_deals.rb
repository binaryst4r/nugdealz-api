class ChangePointValuesOnDeals < ActiveRecord::Migration
  def change
  	remove_column :deals, :point_value
  	add_column :deals, :in_store_price, :float
  end
end
