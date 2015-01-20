class RemoveWrestlerIdFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :wrestler_id
  end
end
