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

require 'spec_helper'

describe EmailLead do
  pending "add some examples to (or delete) #{__FILE__}"
end
