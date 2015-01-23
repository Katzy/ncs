class AddAbbreviationToWrestlers < ActiveRecord::Migration
  def change
    add_column :wrestlers, :abbreviation, :string, default: "", null: false
  end
end
