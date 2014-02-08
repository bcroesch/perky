# == Schema Information
#
# Table name: perks
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  credits    :integer
#  image      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Perk < ActiveRecord::Base
end
