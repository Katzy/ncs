class AddColumnsToTournaments < ActiveRecord::Migration
  def change
    add_column :tournaments, :name, :string
    add_column :tournaments, :size, :string
  end
end
