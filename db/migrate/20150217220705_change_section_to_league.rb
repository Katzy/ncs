class ChangeSectionToLeague < ActiveRecord::Migration
  def change
    rename_column :users, :section, :league
  end
end
