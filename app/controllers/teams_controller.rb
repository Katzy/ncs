class TeamsController < ApplicationController

 before_filter :initialize_teams

 def initialize_teams

    @teams = Team.all
    @users = User.all
    @teams.each do |team|
      @users.each do |user|
        @wrestlers = user.wrestlers
        if team.school == user.school
          @wrestlers.each do |wrestler|
            if wrestler.weight == 106
              team._106 == "X"
            # elsif wrestler.weight == 113
            #   team.update([:_113 => "X"])
            # elsif wrestler.weight == 120
            #   team.update([:_120 => "X"])
            # elsif wrestler.weight == 126
            #   team.update([:_126 => "X"])
            # elsif wrestler.weight == 132
            #   team.update([:_132 => "X"])
            # elsif wrestler.weight == 138
            #   team.update([:_138 => "X"])
            # elsif wrestler.weight == 145
            #   team.update([:_145 => "X"])
            # elsif wrestler.weight == 152
            #   team.update([:_152 => "X"])
            # elsif wrestler.weight == 160
            #   team.update([:_160 => "X"])
            # elsif wrestler.weight == 170
            #   team.update([:_170 => "X"])
            # elsif wrestler.weight == 182
            #   team.update([:_182 => "X"])
            # elsif wrestler.weight == 195
            #   team.update([:_195 => "X"])
            # elsif wrestler.weight == 220
            #   team.update([:_220 => "X"])
            # elsif wrestler.weight == 285
            #   team.update([:_285 => "X"])
            end
            team.update(team_params)
          end
        end
      end
    end
  end


def index
  teams = Team.all
  respond_to do |format|
      format.html
      format.csv { send_data teams.to_csv }
      format.xls { send_data teams.to_csv(col_sep: "\t")}
    end
end

def create
end


private



  def team_params

    params.require(:team).permit(:school, :_106, :_113, :_120, :_126, :_132, :_138, :_145, :_152, :_160, :_170, :_182, :_195, :_220, :_285)
  end

end