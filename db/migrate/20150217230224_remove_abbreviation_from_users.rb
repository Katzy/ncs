class RemoveAbbreviationFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :abbreviation
  end
end
