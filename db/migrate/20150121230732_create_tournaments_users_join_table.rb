class CreateTournamentsUsersJoinTable < ActiveRecord::Migration
def change
    create_table :tournaments_users, id: false do |t|
      t.belongs_to :tournament, index: true
      t.belongs_to :user, index: true
    end
  end
end
