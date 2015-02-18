class RemoveSchoolFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :school
  end
end
