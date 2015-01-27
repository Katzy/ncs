class RemoveTeamsTables < ActiveRecord::Migration
   def up
    drop_table :teams_tables
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
