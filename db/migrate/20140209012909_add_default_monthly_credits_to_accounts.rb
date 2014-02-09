class AddDefaultMonthlyCreditsToAccounts < ActiveRecord::Migration
  def change
    add_column :accounts, :default_monthly_credits, :integer, default: 0
  end
end
