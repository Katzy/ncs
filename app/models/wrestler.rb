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
      csv << ["weight", "school", "abbreviation", "last name", "first name", "full name", "grade", "wins", "losses"]
      all.each do |wrestler|
        csv << [wrestler.weight, wrestler.school, wrestler.abbreviation, wrestler.last_name, wrestler.first_name, wrestler.first_name + " " + wrestler.last_name, wrestler.grade, wrestler.wins, wrestler.losses]
      end
    end
  end
end

