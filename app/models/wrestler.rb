class Wrestler < ActiveRecord::Base

  belongs_to :user

  validates :first_name, presence: true, null: false
  validates :last_name, presence: true, null: false
  validates :weight, presence: true, null: false
  validates :wins, presence: true, null: false
  validates :losses, presence: true, null: false
  validates_uniqueness_of :league_place, scope: [:weight, :league]
  validates_uniqueness_of :school, scope: :weight


  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << ["weight", "league place", "last name", "first name", "grade", "school", "wins", "losses", "league", "abbreviation", "seed"]
      all.each do |wrestler|
        csv << [wrestler.weight, wrestler.league_place, wrestler.last_name, wrestler.first_name, wrestler.grade, wrestler.school, wrestler.wins, wrestler.losses, wrestler.league, wrestler.abbreviation, wrestler.seed]
      end
    end
  end
end

