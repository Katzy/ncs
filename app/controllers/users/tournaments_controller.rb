module Users
  class TournamentsController < ApplicationController

    def index
      @number = 1
      @users = User.order('school ASC')
      @user = User.find(params[:user_id])
      # @tournaments = @team.tournaments.order('name ASC')
      # @tournament = @team.tournaments.new
      @tournament = @user.tournaments.new
      wrestlers = @user.wrestlers.order('weight ASC') # specifically for csv
      @tournaments = @user.tournaments.order('name ASC')
      @wrestlers = @user.wrestlers.order('weight ASC') # for index
      @wrestler = @user.wrestlers.new

    end

    def new
      @user = User.find(params[:user_id])
      @tournament = @user.tournaments.new
    end

    def create
      @user = User.find(params[:user_id])
      @tournament = @user.tournaments.new(tournament_params)

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
      @user = User.find(params[:user_id])
      @tournament = @user.tournament.find(params[:id])
    end

    def update
      @user = User.find(params[:user_id])
      @tournament = @user.tournaments.find(:id)
      if @tournament.update(tournament_params)
        redirect_to users_home_path(@user)
      else
        render :edit
      end
    end

    def destroy
      @tournament = tournament.find_by_id(params[:id])
      @tournament.destroy
      redirect_to users_home_path(@user)
    end

    private

    def tournament_params
      params.require(:tournament).permit(:name, :size, :user_id, :wrestler_id)
    end
  end
end
