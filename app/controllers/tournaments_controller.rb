module Users
  class TournamentsController < ApplicationController

      def index
        @user = User.find(params[:id])
        @tournaments = @user.tournaments.all
      end

      def new
        @user = User.find(params[:id])
        @tournament = @team.tournaments.new
      end

      def create
        @user = User.find(params[:id])
        @tournament = @user.tournament.new(tournament_params)

        respond_to do |format|
          if @tournament.save
            format.html { redirect_to user_tournaments_path, notice: 'tournament was successfully created.' }
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
        @user = User.find(params[:id])
        @tournament = @user.tournament.find(params[:id])
      end

      def update
        @user = User.find(params[:id])
  #      @tournament = team.tournaments.find(params[:id])
        if @tournament.update(tournament_params)
          redirect_to users_home_path
        else
          render :edit
        end
      end

      def destroy
        @tournament = tournament.find_by_id(params[:id])
        @tournament.destroy
        redirect_to users_home_path
      end

      private

      def tournament_params
        params.require(:tournament).permit(:name, :size)
      end
    end
  end