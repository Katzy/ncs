class AddSectionToUsers < ActiveRecord::Migration
  def change
    add_column :users, :section, :string, default: "", null: false
  end
end
