class Team < ActiveRecord::Base

  belongs_to :user

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << ["school", "106", "113", "120", "126", "132", "138", "145", "152", "160", "170", "182", "195", "220", "285"]
      all.each do |team|
        csv << [team.school, team._106, team._113, team._120, team._126, team._132, team._138, team._145, team._152, team._160, team._170, team._182, team._195, team._220, team._285]
      end
    end
  end
end
