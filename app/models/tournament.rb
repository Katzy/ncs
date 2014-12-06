class Tournament < ActiveRecord::Base

  belongs_to :team

  validates :name, presence: true, uniqueness: true

end
