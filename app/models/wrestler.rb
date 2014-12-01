class Wrestler < ActiveRecord::Base

  belongs_to :team

  validates :first_name, presence: true, null: false
  validates :last_name, presence: true, null: false
  validates :weight, presence: true, null: false

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |wrestler|
        csv << wrestler.attributes.values_at(*column_names)
      end
    end
  end
end
