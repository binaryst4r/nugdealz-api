class Payment < ActiveRecord::Base
  attr_accessor :stripe_card_token

  belongs_to :user
  belongs_to :deal


  def save_with_payment
    if valid?
      if self.user.stripe_customer_token
        customer = Stripe::Customer.retrieve(self.user.stripe_customer_token)
      else
        customer = Stripe::Customer.create(description: "#{self.user.full_name}", card: stripe_card_token)
        self.user.stripe_customer_token = customer.id
        self.user.save
      end
      charge = Stripe::Charge.create(customer: customer.id, currency: 'usd', amount: amount.to_i, description: "#{self.user.full_name}")
      self.charge_token = charge.id
      self.card_last_4 = charge.source.last4
      self.card_brand = charge.source.brand
      self.description = "Deal #{self.deal.id} - #{self.deal.title}"
      save!
    end

    rescue Stripe::InvalidRequestError => e
      logger.error "Stripe error while creating payment: #{e.message}"
      errors.add :base, "There was a problem charging your credit card."
      false
  end



end
