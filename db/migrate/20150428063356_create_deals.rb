class CreateDeals < ActiveRecord::Migration
  def change
    create_table :deals do |t|
      t.string :title
      t.text :description
      t.text :fine_print
      t.integer :point_value
      t.integer :quantity_available
      t.integer :dispensary_id

      t.timestamps
    end
  end
end
