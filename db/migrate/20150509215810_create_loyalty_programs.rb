class CreateLoyaltyPrograms < ActiveRecord::Migration
  def change
    create_table :loyalty_programs do |t|
      t.integer :user_id
      t.integer :dispensary_id

      t.timestamps
    end
  end
end
