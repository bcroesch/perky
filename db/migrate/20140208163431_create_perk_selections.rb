class CreatePerkSelections < ActiveRecord::Migration
  def change
    create_table :perk_selections do |t|
      t.references :user, index: true
      t.references :perk, index: true

      t.timestamps
    end
  end
end
