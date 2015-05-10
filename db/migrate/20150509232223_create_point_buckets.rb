class CreatePointBuckets < ActiveRecord::Migration
  def change
    create_table :point_buckets do |t|
      t.integer :user_id
      t.integer :loyalty_program_id
      t.float :value

      t.timestamps
    end
  end
end
