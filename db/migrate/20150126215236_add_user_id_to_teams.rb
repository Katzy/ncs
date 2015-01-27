class AddUserIdToTeams < ActiveRecord::Migration
  def change
    change_table :teams do |t|
      t.references :user, index: true
    end
  end
end
