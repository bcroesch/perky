class CreateEmailLeads < ActiveRecord::Migration
  def change
    create_table :email_leads do |t|
      t.string :email
      t.string :company_name
      t.integer :company_size

      t.timestamps
    end
  end
end
