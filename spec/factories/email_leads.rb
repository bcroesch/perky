# == Schema Information
#
# Table name: email_leads
#
#  id           :integer          not null, primary key
#  email        :string(255)
#  company_name :string(255)
#  company_size :integer
#  created_at   :datetime
#  updated_at   :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :email_lead do
    email "MyString"
    company_name "MyString"
    company_size 1
  end
end
