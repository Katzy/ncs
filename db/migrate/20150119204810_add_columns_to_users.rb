class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :school, :string, null: false, default: ""
    add_column :users, :abbreviation, :string, null: false, default: ""
    add_column :users, :cell, :string, null: false, default: ""
  end
end
