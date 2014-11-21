class Wrestler < ActiveRecord::Base

  belongs_to :team

  validates :name, presence: true, null: false
  validates :weight_class, presence: true, null: false
end
