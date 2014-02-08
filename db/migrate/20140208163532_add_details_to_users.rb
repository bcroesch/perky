class AddDetailsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :superuser, :boolean
    add_column :users, :admin, :boolean
    add_column :users, :monthly_credits, :integer
    add_reference :users, :account, index: true
    add_column :users, :adhoc_credits, :integer
  end
end
