module Teams
  class WrestlersController < ApplicationController

    def index
      @teams = Team.order('name ASC')
      @team = Team.find(params[:team_id])
      wrestlers = @team.wrestlers.order('weight ASC')
      @wrestlers = @team.wrestlers.order('weight ASC')
      @wrestler = @team.wrestlers.new
      respond_to do |format|
      format.html
      format.csv { send_data wrestlers.to_csv }
      format.xls { send_data wrestlers.to_csv(col_sep: "\t")}
    end
    end

    def new
      @teams = Team.order('name ASC')
      @team = Team.find(params[:team_id])
      @wrestler = @team.wrestlers.new
    end

    def create
      @team = Team.find(params[:team_id])
      @wrestler = @team.wrestlers.new(wrestler_params)
      @wrestler.school = @team.name

      respond_to do |format|
        if @wrestler.save
          format.html { redirect_to team_wrestlers_path, notice: 'wrestler was successfully created.' }
          format.json { render action: 'show', status: :created, location: @wrestler }
          # added:
          format.js   { render action: 'show', status: :created, location: @wrestler }
        else
          format.html { render action: 'new' }
          format.json { render json: @wrestler.errors, status: :unprocessable_entity }
          # added:
          format.js   { render json: @wrestler.errors, status: :unprocessable_entity }
        end
      end
    end

    def edit
      @team = Team.find(params[:team_id])
      @wrestler = @team.wrestlers.find(params[:id])
    end

    def show
      @teams = Team.order('name ASC')
      @team = Team.find(params[:team_id])
      @wrestler = @team.wrestlers.find(params[:id])
    end

    def update
      @wrestlers = Wrestler.order('weight ASC')
      @wrestler = Wrestler.find(params[:id])

      if @wrestler.update(wrestler_params)
        redirect_to teams_path
      else
        render :edit
      end
    end

    def destroy
      @wrestler = wrestler.find_by_id(params[:id])
      @wrestler.destroy
      redirect_to wrestlers_path
    end


    private

    def wrestler_params
    params.require(:wrestler).permit(:school, :first_name, :last_name, :weight, :grade, :wins, :losses, :section_place, :state_place, :tourney1_place, :tourney2_place, :tourney3_place, :tourney4_place, :tourney5_place, :tourney6_place, :tourney7_place, :tourney8_place, :comments, :team_id)
    end
  end
end
