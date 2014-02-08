class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :name
      t.string :stripe_customer_token

      t.timestamps
    end
  end
end
