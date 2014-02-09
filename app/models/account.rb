# == Schema Information
#
# Table name: accounts
#
#  id                      :integer          not null, primary key
#  name                    :string(255)
#  stripe_customer_token   :string(255)
#  created_at              :datetime
#  updated_at              :datetime
#  default_monthly_credits :integer          default(0)
#

class Account < ActiveRecord::Base
  has_many :users

  CREDIT_PRICE = 5

  after_create :generate_stripe_token

  attr_accessor :stripe_card_token

  def generate_stripe_token
    customer = Stripe::Customer.create(card: stripe_card_token, description: "#{id} - #{name}")
    update_attribute(:stripe_customer_token, customer.id)

    # Stripe::Charge.create(
    #     :amount => 100,
    #     :currency => "usd",
    #     :customer => customer.id
    # )
  rescue Stripe::StripeError => e
    logger.warn e
  end

  def total_monthly_allocation
    @total_monthly_allocation ||= users.map(&:monthly_credits).compact.reduce(0){|sum, val| sum += (val * CREDIT_PRICE) }
  end

  def monthly_spend
    @monthly_spend ||= users.map{|user| user.perks.map(&:credits) }.flatten.compact.reduce(0){|sum, val| sum += (val * CREDIT_PRICE) }
  end

  def process_monthly_stripe_charge
    return if monthly_spend == 0

    Stripe::Charge.create(
      amount: monthly_spend * 100,
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
