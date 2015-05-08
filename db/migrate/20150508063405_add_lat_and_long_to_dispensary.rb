class AddLatAndLongToDispensary < ActiveRecord::Migration
  def change
    add_column :dispensaries, :latitude, :float
    add_column :dispensaries, :longitude, :float
  end
end
