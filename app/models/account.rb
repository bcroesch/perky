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
end
