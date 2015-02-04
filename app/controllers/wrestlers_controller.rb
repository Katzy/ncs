class WrestlersController < ApplicationController
  respond_to  :html, :js

  def index

    @wrestlers = Wrestler.order('weight ASC, wins DESC')
    wrestlers = Wrestler.order('weight ASC, wins DESC')  # for csv format


    respond_to do |format|
      format.html
      format.csv { send_data wrestlers.to_csv }
      format.xls { send_data wrestlers.to_csv(col_sep: "\t")}
    end
  end

  def sort_by_school
    @wrestlers = Wrestler.order('school ASC')
    wrestlers = Wrestler.order('school ASC')
    respond_to do |format|
      format.html
      format.csv { send_data wrestlers.order('school ASC').to_csv }
      format.xls { send_data wrestlers.order('school ASC').to_csv(col_sep: "\t")}
    end
  end

  def sort_by_state_place
    @wrestlers = Wrestler.order('state_place ASC')
    wrestlers = Wrestler.order('state_place ASC')
    respond_to do |format|
      format.html
      format.csv { send_data wrestlers.to_csv }
      format.xls { send_data wrestlers.to_csv(col_sep: "\t")}
    end
  end

  def new
    @team = Team.find(params[:id])
    @wrestler = @team.wrestlers.new
  end

  def create
    @team = Team.find_by_params(params[:school])
    @wrestler = team.wrestlers.create(wrestler_params)
    user = current_user

    respond_to do |format|
      if @wrestler.save
        UserMailer.wrestler_added(user).deliver
        format.html { redirect_to team_path, notice: 'wrestler was successfully created.' }
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
    @wrestler = Wrestler.find(params[:id])
  end

  def show
    @wrestler = Wrestler.find(params[:id])
  end

  def update
    @wrestler = Wrestler.find(params[:id])

    user = current_user
    if @wrestler.update(wrestler_params)
      UserMailer.wrestler_updated(user).deliver
      if current_user.admin?
        redirect_to root_url
      else
        redirect_to user_wrestlers_path(user)
      end
    else
      render :edit
    end
  end

  def destroy
    user = current_user
    @wrestler = Wrestler.find(params[:id])
    @wrestler.destroy
    UserMailer.wrestler_deleted(user).deliver
    redirect_to :back
  end

  private

  def wrestler_params
    params.require(:wrestler).permit(:first_name, :last_name, :weight, :grade, :wins, :losses, :section_place, :state_place, :tourney1_place, :tourney2_place, :tourney3_place, :tourney4_place, :tourney5_place, :tourney6_place, :tourney7_place, :tourney8_place, :comments, :user_id, :tournament_id)
  end

end
