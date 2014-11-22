class AddTimeofDayTypeofDropToDrops < ActiveRecord::Migration
  def change
    add_column :drops, :time_of_day, :string
    add_column :drops, :type_of_drop, :string
  end
end
