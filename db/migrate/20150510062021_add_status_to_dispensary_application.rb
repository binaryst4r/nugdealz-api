class AddStatusToDispensaryApplication < ActiveRecord::Migration
  def change
    add_column :dispensary_applications, :verified, :boolean, default: false
  end
end
