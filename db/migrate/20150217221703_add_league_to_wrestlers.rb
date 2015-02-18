class AddLeagueToWrestlers < ActiveRecord::Migration
  def change
    add_column :wrestlers, :league, :string
  end
end
