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

  after_create :generate_stripe_token

  attr_accessor :stripe_card_token

  def generate_stripe_token
    binding.pry
    customer = Stripe::Customer.create(card: stripe_card_token, description: "#{id} - #{name}")
    update_attribute(:stripe_customer_token, customer.id)
  rescue Stripe::StripeError => e
    binding.pry
    logger.warn e
  end
end
