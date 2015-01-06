class CreateTournamentsWrestlers < ActiveRecord::Migration
  def change
    create_table :tournaments_wrestlers, id: false do |t|
      t.belongs_to :tournament, index: true
      t.belongs_to :wrestler, index: true
    end
  end
end
