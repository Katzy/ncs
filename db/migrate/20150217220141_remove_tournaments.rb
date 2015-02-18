class RemoveTournaments < ActiveRecord::Migration
  def change
    drop_table :tournaments
  end
end
