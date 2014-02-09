# == Schema Information
#
# Table name: accounts
#
#  id                    :integer          not null, primary key
#  name                  :string(255)
#  stripe_customer_token :string(255)
#  created_at            :datetime
#  updated_at            :datetime
#

class Account < ActiveRecord::Base
  has_many :users

  CREDIT_PRICE = 10

  after_create :generate_stripe_token

  attr_accessor :stripe_card_token

  def generate_stripe_token
    binding.pry
    customer = Stripe::Customer.create(card: stripe_card_token, description: "#{id} - #{name}")
    update_attribute(:stripe_customer_token, customer.id)

    # Stripe::Charge.create(
    #     :amount => 100,
    #     :currency => "usd",
    #     :customer => customer.id
    # )
  rescue Stripe::StripeError => e
    binding.pry
    logger.warn e
  end

  def process_monthly_stripe_charge
    charge_amount = users.map(&:monthly_credits).compact.reduce(0){|sum, val| sum += (val * CREDIT_PRICE) }
    return if charge_amount == 0
    binding.pry
    Stripe::Charge.create(
      amount: charge_amount * 100,
      currency: "usd",
      customer: stripe_customer_token
    )
  end

  def self.process_account_charges
    all.each do |account|
      account.process_monthly_stripe_charge
    end
  end
end
