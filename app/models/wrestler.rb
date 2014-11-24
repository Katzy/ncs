class Wrestler < ActiveRecord::Base

  belongs_to :team

  validates :first_name, presence: true, null: false
  validates :last_name, presence: true, null: false

end
