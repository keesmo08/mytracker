class CreateDrops < ActiveRecord::Migration
  def change
    create_table :drops do |t|
      t.string :account
      t.datetime :scheduledrop
      t.datetime :actualdrop
      t.string :contactname
      t.string :contactaddress
      t.string :contactphone
      t.string :contactemail
      t.string :notes

      t.timestamps
    end
  end
end
