class AddTeamIdToTournaments < ActiveRecord::Migration
  def change
    change_table :tournaments do |t|
      t.references :team, index: true
    end
  end
end
