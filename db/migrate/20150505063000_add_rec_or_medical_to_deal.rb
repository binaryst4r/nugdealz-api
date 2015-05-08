class AddRecOrMedicalToDeal < ActiveRecord::Migration
  def change
    add_column :deals, :medical, :boolean
    add_column :deals, :recreational, :boolean
  end
end
