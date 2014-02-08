# == Schema Information
#
# Table name: unused_credits
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  credits    :integer
#  created_at :datetime
#  updated_at :datetime
#

class UnusedCredit < ActiveRecord::Base
  belongs_to :user

  class << self
    def reclaim(user, credits)
      UnusedCredit.create(user: user, credits: credits)
    end
  end
end
