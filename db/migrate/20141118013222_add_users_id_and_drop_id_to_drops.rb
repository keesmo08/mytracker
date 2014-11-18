class AddUsersIdAndDropIdToDrops < ActiveRecord::Migration
  def change
    add_column :drops, :drop_id, :integer
    add_column :drops, :user_id, :integer
  end
end
