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

class Purchase < ActiveRecord::Base
  belongs_to :perk
  belongs_to :user
end
