class AddRecOrMedicalToApplications < ActiveRecord::Migration
  def change
    add_column :dispensary_applications, :medical, :boolean
    add_column :dispensary_applications, :recreational, :boolean
  end
end
