class CreateTournamentsUsers < ActiveRecord::Migration
  def change
    create_table :tournaments_teams, id: false do |t|
      t.belongs_to :tournament, index: true
      t.belongs_to :user, index: true
    end
  end
end
