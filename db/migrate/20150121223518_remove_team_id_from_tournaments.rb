class RemoveTeamIdFromTournaments < ActiveRecord::Migration
  def change
    remove_column :tournaments, :team_id
  end
end
