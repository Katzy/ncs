
  class TournamentsController < ApplicationController

      def index
        @number = 1
        @user = User.find(params[:id])
        @tournaments = @user.tournaments.order('name ASC')
      end

      def new
        @user = User.find(params[:id])
        @tournament = @user.tournaments.new
      end

      def create
        @user = User.find(params[:id])
        @tournament = @user.tournaments.new(tournament_params)

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
        @tournament = Tournament.find(params[:id])
      end

      def update
       @tournament = Tournament.find(params[:id])
  #      @tournament = team.tournaments.find(params[:id])
        if @tournament.update(tournament_params)
          redirect_to users_home_path
        else
          render :edit
        end
      end

      def destroy
        @tournament = Tournament.find(params[:id])
        @tournament.destroy
        redirect_to users_home_path(@user)
      end

      private

      def tournament_params
        params.require(:tournament).permit(:name, :size, :user_id, :wrestler_id)
      end
    end
