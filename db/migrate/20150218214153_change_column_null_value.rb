class ChangeColumnNullValue < ActiveRecord::Migration
  def change
    change_column_null :users, :league, true
  end
end
