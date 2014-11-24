class AddColumnsToWrestlersTable < ActiveRecord::Migration
  def up
    add_column :wrestlers, :first_name, :string
    add_column :wrestlers, :last_name, :string
    add_column :wrestlers, :weight, :integer
    add_column :wrestlers, :grade, :integer
    add_column :wrestlers, :wins, :integer
    add_column :wrestlers, :losses, :integer
    add_column :wrestlers, :section_place, :integer
    add_column :wrestlers, :state_place, :integer
    add_column :wrestlers, :tourney1_place, :integer
    add_column :wrestlers, :tourney2_place, :integer
    add_column :wrestlers, :tourney3_place, :integer
    add_column :wrestlers, :tourney4_place, :integer
    add_column :wrestlers, :tourney5_place, :integer
    add_column :wrestlers, :tourney6_place, :integer
    add_column :wrestlers, :tourney7_place, :integer
    add_column :wrestlers, :tourney8_place, :integer
  end
end
