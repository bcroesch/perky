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

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :account do
    name "MyString"
    stripe_customer_token "MyString"
  end
end
