class AddSeedToWrestlers < ActiveRecord::Migration
  def change
    add_column :wrestlers, :seed, :integer
  end
end
