class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.integer :user_id
      t.integer :amount
      t.integer :deal_id
      t.string :charge_token
      t.string :card_last_4
      t.string :card_brand
      t.text :description
      t.string :created_at
      t.string :updated_at

      t.timestamps
    end
  end
end
