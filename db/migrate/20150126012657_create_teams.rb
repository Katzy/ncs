class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :school
      t.string :_106
      t.string :_113
      t.string :_120
      t.string :_126
      t.string :_132
      t.string :_138
      t.string :_145
      t.string :_152
      t.string :_160
      t.string :_170
      t.string :_182
      t.string :_195
      t.string :_220
      t.string :_285
    end
  end
end
