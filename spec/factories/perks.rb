# == Schema Information
#
# Table name: perks
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  credits     :integer
#  image       :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#  description :text
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :perk do
    name "MyString"
    credits 1
    image "MyString"
  end
end
