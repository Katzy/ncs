class AddTournamentIdToUsers < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.references :tournament, index: true
    end
  end
end
