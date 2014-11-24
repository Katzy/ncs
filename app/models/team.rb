class Team < ActiveRecord::Base

  has_many :users
  has_many :wrestlers

  validates :name, presence: true
  validates :section, presence: true
end
