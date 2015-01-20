class AddWrestlerIdToUsers < ActiveRecord::Migration
def change
    change_table :users do |t|
      t.references :wrestler, index: true
    end
  end
end
