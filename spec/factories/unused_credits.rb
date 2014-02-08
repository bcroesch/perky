# == Schema Information
#
# Table name: unused_credits
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  credits    :integer
#  created_at :datetime
#  updated_at :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :unused_credit do
    user_id 1
    credits 1
  end
end
