# == Schema Information
#
# Table name: perk_selections
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  perk_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class PerkSelection < ActiveRecord::Base
  belongs_to :user
  belongs_to :perk
end
