class AddCommentsToWrestlers < ActiveRecord::Migration
  def change
    add_column :wrestlers, :comments, :text
  end
end
