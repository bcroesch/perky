class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.string :type
      t.references :perk, index: true
      t.references :user, index: true
      t.integer :credits

      t.timestamps
    end
  end
end
