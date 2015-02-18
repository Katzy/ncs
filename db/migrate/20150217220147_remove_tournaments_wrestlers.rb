class RemoveTournamentsWrestlers < ActiveRecord::Migration
  def change
    drop_table :tournaments_wrestlers
  end
end
