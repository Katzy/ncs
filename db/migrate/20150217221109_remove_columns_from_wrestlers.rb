class RemoveColumnsFromWrestlers < ActiveRecord::Migration
  def change
    remove_column :wrestlers, :tourney1_place
    remove_column :wrestlers, :tourney2_place
    remove_column :wrestlers, :tourney3_place
    remove_column :wrestlers, :tourney4_place
    remove_column :wrestlers, :tourney5_place
    remove_column :wrestlers, :tourney6_place
    remove_column :wrestlers, :tourney7_place
    remove_column :wrestlers, :tourney8_place
    remove_column :wrestlers, :state_place
  end
end
