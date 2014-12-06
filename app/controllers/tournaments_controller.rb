class TournamentsController < ApplicationController

    def index
      team = Team.find(params[:team_id])
      @tournaments = team.tournaments
    end

    def new
      @team = Team.find(params[:team_id])
      @tournament = @team.tournament.new
    end

    def create
      @team = Team.find(params[:team_id])
      @tournament = @team.tournament.new(tournament_params)

      respond_to do |format|
        if @tournament.save
          format.html { redirect_to team_tournaments_path, notice: 'tournament was successfully created.' }
          format.json { render action: 'index', status: :created, location: @tournament }
          # added:
          format.js   { render action: 'index', status: :created, location: @tournament }
        else
          format.html { render action: 'new' }
          format.json { render json: @tournament.errors, status: :unprocessable_entity }
          # added:
          format.js   { render json: @tournament.errors, status: :unprocessable_entity }
        end
      end
    end

    def edit
      @team = Team.find(params[:team_id])
      @tournament = @team.tournament.find(params[:id])
    end

    def update
      team = Team.find(params[:team_id])
      @tournament = team.tournaments.find(:id)
      if @tournament.update(tournament_params)
        redirect_to team_path
      else
        render :edit
      end
    end

    def destroy
      @tournament = tournament.find_by_id(params[:id])
      @tournament.destroy
      redirect_to team_path
    end

    private

    def tournament_params
      params.require(:tournament).permit(:name, :size)
    end
  end