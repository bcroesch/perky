# == Schema Information
#
# Table name: purchases
#
#  id         :integer          not null, primary key
#  kind       :string(255)
#  perk_id    :integer
#  user_id    :integer
#  credits    :integer
#  created_at :datetime
#  updated_at :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :purchase do
    type ""
    perk nil
    user nil
    credits 1
  end
end
