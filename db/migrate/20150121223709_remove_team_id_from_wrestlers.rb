class RemoveTeamIdFromWrestlers < ActiveRecord::Migration
  def change
    remove_column :wrestlers, :team_id
  end
end
