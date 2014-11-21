class Team < ActiveRecord::Base

  validates :name, presence: true
  validates :section, presence: true
end
