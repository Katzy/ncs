class AddSchoolToWrestlers < ActiveRecord::Migration
  def change
    add_column :wrestlers, :school, :string
  end
end
