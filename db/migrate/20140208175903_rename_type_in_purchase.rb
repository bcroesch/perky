class RenameTypeInPurchase < ActiveRecord::Migration
  def change
    rename_column :purchases, :type, :kind
  end
end
