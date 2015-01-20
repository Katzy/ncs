class Wrestler < ActiveRecord::Base

  belongs_to :user

  validates :first_name, presence: true, null: false
  validates :last_name, presence: true, null: false
  validates :weight, presence: true, null: false

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << ["weight", "school", "last_name", "first_name", "grade", "wins", "losses"]
      all.each do |wrestler|
        csv << [wrestler.weight, wrestler.school, wrestler.last_name, wrestler.first_name, wrestler.grade, wrestler.wins, wrestler.losses]
      end
    end
  end
end

