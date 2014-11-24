class AddTeamIdToWrestler < ActiveRecord::Migration
  def change
    change_table :wrestlers do |t|
      t.references :team, index: true
    end
  end
end
