class SetMonthlyCreditsDefaultOnUsers < ActiveRecord::Migration
  def change
    change_column :users, :monthly_credits, :integer, default: 0
    change_column :users, :adhoc_credits, :integer, default: 0
  end
end
