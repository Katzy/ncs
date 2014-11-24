module Teams
  class WrestlersController < ApplicationController

    def index
      @teams = Team.order('name ASC')
      @team = Team.find(params[:team_id])
      @wrestlers = @team.wrestlers
      @wrestlers
      p params
    end

    def new
      @teams = Team.order('name ASC')
      @team = Team.find(params[:team_id])
      @wrestler = @team.wrestlers.new
    end

  def create
    @team = Team.find(params[:team_id])
    @wrestler = Wrestler.new(wrestler_params)

    respond_to do |format|
      if @wrestler.save
        format.html { redirect_to @wrestler, notice: 'wrestler was successfully created.' }
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
    private

    def wrestler_params
    params.require(:wrestler).permit(:first_name, :last_name, :grade, :wins, :losses, :section_place, :state_place, :tourney1_place, :tourney2_place, :tourney3_place, :tourney4_place, :tourney5_place, :tourney6_place, :tourney7_place, :tourney8_place, :team_id)
    end
  end
end
