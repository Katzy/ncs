module Users
  class WrestlersController < ApplicationController

    def index
      @number = 1
      user = User.find(params[:user_id])

      @user = User.find(params[:user_id])
      wrestlers = @user.wrestlers.order('weight ASC, league_place ASC') # specifically for csv
      @wrestlers = @user.wrestlers.order('weight ASC, league_place ASC') # for index
      @wrestler = @user.wrestlers.new

      respond_to do |format|
        format.html
        format.csv { send_data wrestlers.to_csv, filename: user.league + '.csv' }
        format.xls { send_data wrestlers.to_csv(col_sep: "\t"), filename: user.league + '.xls' }
      end
    end

    def new
      @user = User.find(params[:user_id])
      @wrestler = @user.wrestlers.new

    end

    def create
      @user = User.find(params[:user_id])

      @wrestler = @user.wrestlers.new(wrestler_params)
      @wrestler.league = @user.league


      user = current_user

      respond_to do |format|
        if @wrestler.save
          UserMailer.wrestler_added(user).deliver
          format.html { redirect_to user_wrestlers_path, notice: 'wrestler was successfully created.' }
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
      @wrestler = @team.wrestlers.find(params[:id])
    end

    def update
      @wrestlers = Wrestler.order('weight ASC')
      @wrestler = Wrestler.find(params[:id])

      if @wrestler.update(wrestler_params)

        redirect_to users_home_path(current_user)
      else
        render :edit
      end
    end

    def destroy
      user = current_user
      @wrestler = wrestler.find_by_id(params[:id])
      @wrestler.destroy
      UserMailer.wrestler_deleted(user).deliver
      redirect_to wrestlers_path
    end


    private

    def wrestler_params
      params.require(:wrestler).permit(:school, :first_name, :last_name, :weight, :grade, :wins, :losses, :league_place,  :comments, :seed, :user_id)
    end

  end
end
