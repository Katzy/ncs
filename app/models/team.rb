class Team < ActiveRecord::Base

  has_many :users
  has_many :wrestlers
  has_many :tournaments

  validates :name, presence: true, uniqueness: true
  validates :section, presence: true

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |team|
        csv << team.attributes.values_at(*column_names)
      end
    end
  end
end
