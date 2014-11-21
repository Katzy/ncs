class AddFieldsToTeams < ActiveRecord::Migration
  def change
    add_column :teams, :coach, :string
    add_column :teams, :cell, :string
  end
end
