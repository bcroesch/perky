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

  def purchase(kind)
    Purchase.create(kind: kind,
                    perk: self.perk,
                    user: self.user,
                    credits: self.perk.credits)
  end

  def monthly 
    purchase('recurring')    
  end

  def one_time
    purchase('onetime')
  end

  def as_json(options={})
    super(:only => [:id, :user_id],
          :include => {:perk => {
                          :only => [:id, :credits]
                      }
          }
    )
  end
end
