# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#  superuser              :boolean
#  admin                  :boolean
#  monthly_credits        :integer          default(0)
#  account_id             :integer
#  adhoc_credits          :integer          default(0)
#  first_name             :string(255)
#  last_name              :string(255)
#

class User < ActiveRecord::Base
  has_many :perk_selections
  has_many :purchases
  has_many :unused_credits
  has_many :perks, through: :perk_selections

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :account

  accepts_nested_attributes_for :account

  def name
    [first_name, last_name].join(" ")
  end
end
