class RemoveTournamentIdFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :tournament_id
  end
end
