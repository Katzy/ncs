class DropTableTournamentsTeams < ActiveRecord::Migration
  def up
    drop_table :tournaments_teams
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
