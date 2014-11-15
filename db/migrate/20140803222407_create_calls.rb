class CreateCalls < ActiveRecord::Migration
  def change
    create_table :calls do |t|
      t.integer :call_id
      t.integer :user_id
      t.string :results
      t.boolean :spoken
      t.boolean :rvm
      t.boolean :lvm
      t.date :date
      t.datetime :time

      t.timestamps
    end
  end
end
