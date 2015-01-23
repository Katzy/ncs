class AddUserIdToTournaments < ActiveRecord::Migration
  def change
    change_table :tournaments do |t|
      t.references :user, index: true
    end
  end
end
