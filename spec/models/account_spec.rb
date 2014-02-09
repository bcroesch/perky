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

require 'spec_helper'

describe Account do
  pending "add some examples to (or delete) #{__FILE__}"
end
