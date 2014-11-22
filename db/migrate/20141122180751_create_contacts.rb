class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :contact_name
      t.string :contact_address
      t.string :contact_phone
      t.string :contact_email
      t.boolean :contact_active

      t.timestamps
    end
  end
end
