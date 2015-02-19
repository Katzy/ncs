class ChangeNullValueWrestlersAbbrev < ActiveRecord::Migration
  def change
    change_column_null :wrestlers, :abbreviation, true
  end
end
