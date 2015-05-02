class CreateDispensaryApplications < ActiveRecord::Migration
  def change
    create_table :dispensary_applications do |t|
      t.string :dispensary_name
      t.string :contact_name
      t.string :contact_email
      t.string :phone
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.string :zip
      t.timestamps
    end
  end
end
