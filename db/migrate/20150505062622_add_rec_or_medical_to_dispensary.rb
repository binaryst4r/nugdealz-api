class AddRecOrMedicalToDispensary < ActiveRecord::Migration
  def change
    add_column :dispensaries, :recreational, :boolean
    add_column :dispensaries, :medical, :boolean
    add_column :deals, :price, :float

    remove_column :deals, :in_store_price
  end
end
