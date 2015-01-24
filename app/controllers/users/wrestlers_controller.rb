module Users
  class WrestlersController < ApplicationController

    def index
      @number = 1
      user = User.find(params[:user_id])
      @teams = Team.order('name ASC')
      @user = User.find(params[:user_id])
      wrestlers = @user.wrestlers.order('weight ASC') # specifically for csv
      @wrestlers = @user.wrestlers.order('weight ASC') # for index
      @wrestler = @user.wrestlers.new
      @tournaments = @user.tournaments.order('name ASC')
      @tournament = @user.tournaments.new
      respond_to do |format|
        format.html
        format.csv { send_data wrestlers.to_csv, filename: user.school + '.csv' }
        format.xls { send_data wrestlers.to_csv(col_sep: "\t"), filename: user.school + '.xls' }
      end
    end

    def new
      @user = User.find(params[:user_id])
      @wrestler = @user.wrestlers.new
    end

    def create
      @user = User.find(params[:user_id])
      @wrestler = @user.wrestlers.new(wrestler_params)
      @wrestler.abbreviation = @user.abbreviation
      @wrestler.school = @user.school
      respond_to do |format|
        if @wrestler.save
          format.html { redirect_to team_wrestlers_path, notice: 'wrestler was successfully created.' }
          format.json { render action: 'index', status: :created, location: @wrestler }
          # added:
          format.js   { render action: 'index', status: :created, location: @wrestler }
        else
          format.html { render action: 'new' }
          format.json { render json: @wrestler.errors, status: :unprocessable_entity }
          # added:
          format.js   { render json: @wrestler.errors, status: :unprocessable_entity }
        end
      end
    end

    def edit
      @user = User.find(params[:user_id])
      @wrestler = @user.wrestlers.find(params[:id])
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
        redirect_to @wrestler.team
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
      params.require(:wrestler).permit(:school, :first_name, :last_name, :weight, :grade, :wins, :losses, :section_place, :state_place, :tourney1_place, :tourney2_place, :tourney3_place, :tourney4_place, :tourney5_place, :tourney6_place, :tourney7_place, :tourney8_place, :comments, :user_id, :tournament_id)
    end
  end
end
