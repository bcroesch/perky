class CreateUnusedCredits < ActiveRecord::Migration
  def change
    create_table :unused_credits do |t|
      t.integer :user_id
      t.integer :credits

      t.timestamps
    end
  end
end
