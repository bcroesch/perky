# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :purchase do
    type ""
    perk nil
    user nil
    credits 1
  end
end
