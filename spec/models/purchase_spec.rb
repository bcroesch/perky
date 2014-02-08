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

require 'spec_helper'

describe Purchase do
  pending "add some examples to (or delete) #{__FILE__}"
end
