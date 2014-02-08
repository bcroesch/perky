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

require 'spec_helper'

describe Perk do
  pending "add some examples to (or delete) #{__FILE__}"
end
