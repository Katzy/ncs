class Team < ActiveRecord::Base

  after_update :send_email

  has_many :users
  has_many :wrestlers
  has_many :tournaments

  validates :name, presence: true, uniqueness: true
  validates :section, presence: true

  def send_email
  end

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << ["name", "coach", "email", "cell"]
      all.each do |team|
        csv << team.attributes.values_at(*column_names)
      end
    end
  end
end
