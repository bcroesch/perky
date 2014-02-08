class AddDescriptionToPerk < ActiveRecord::Migration
  def change
    add_column :perks, :description, :text
  end
end
