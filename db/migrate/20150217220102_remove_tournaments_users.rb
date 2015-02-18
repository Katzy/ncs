class RemoveTournamentsUsers < ActiveRecord::Migration
  def change
    drop_table :tournaments_users
  end
end
