class CreatePerks < ActiveRecord::Migration
  def change
    create_table :perks do |t|
      t.string :name
      t.integer :credits
      t.string :image

      t.timestamps
    end
  end
end
