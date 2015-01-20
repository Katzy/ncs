class AddUserIdToWrestlers < ActiveRecord::Migration
  def change
    change_table :wrestlers do |t|
      t.references :user, index: true
    end
  end
end
