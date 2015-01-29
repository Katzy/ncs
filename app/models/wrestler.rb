class Wrestler < ActiveRecord::Base

  belongs_to :user
  belongs_to :tournament
  accepts_nested_attributes_for :tournament

  validates :first_name, presence: true, null: false
  validates :last_name, presence: true, null: false
  validates :weight, presence: true, null: false
  validates_uniqueness_of :weight, scope: :user_id

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << ["weight", "school", "abbreviation", "last name", "first name", "full name", "grade", "wins", "losses", "SEC", "ST", "T1", "T2", "T3", "T4", "T5", "T6", "T7", "T8", "Comments"]
      all.each do |wrestler|
        csv << [wrestler.weight, wrestler.school, wrestler.abbreviation, wrestler.last_name, wrestler.first_name, wrestler.first_name + "" + wrestler.last_name, wrestler.grade, wrestler.wins, wrestler.losses, wrestler.section_place, wrestler.state_place, wrestler.tourney1_place, wrestler.tourney2_place, wrestler.tourney3_place, wrestler.tourney4_place, wrestler.tourney5_place, wrestler.tourney6_place, wrestler.tourney7_place, wrestler.tourney8_place, wrestler.comments ]
      end
    end
  end
end

