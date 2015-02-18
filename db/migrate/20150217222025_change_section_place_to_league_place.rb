class ChangeSectionPlaceToLeaguePlace < ActiveRecord::Migration
  def change
    remove_column :wrestlers, :section_place
    add_column :wrestlers, :league_place, :string
  end

end
