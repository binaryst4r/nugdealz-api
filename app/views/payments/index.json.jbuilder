json.array!(@payments) do |payment|
  json.extract! payment, :id, :user_id, :amount, :deal_id, :charge_token, :card_last_4, :card_brand, :description, :created_at, :updated_at
  json.url payment_url(payment, format: :json)
end
