class WrestlersController < ApplicationController
  respond_to  :html, :js

  def index
    @wrestlers = Wrestler.order('weight ASC')
    wrestlers = Wrestler.order('weight ASC')  # for csv format
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
    team = Team.find(params[:team_id])
    @wrestler = team.wrestlers.create(wrestler_params)

    respond_to do |format|
      if @wrestler.save
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
    @team = Team.find_by_id(params[:team_id])
    @wrestler = Wrestler.find(params[:id])
  end

  def show
    @wrestler = Wrestler.find(params[:id])
  end

  def update
    @wrestler = Wrestler.find(params[:id])
    @team = Team.find_by_id(params[:team_id])
    if @wrestler.update(wrestler_params)
      redirect_to root_url
    else
      render :edit
    end
  end

  def destroy
    @wrestler = Wrestler.find(params[:id])
    @wrestler.destroy
    redirect_to :back
  end

  private

  def wrestler_params
    params.require(:wrestler).permit(:first_name, :last_name, :weight, :grade, :wins, :losses, :section_place, :state_place, :tourney1_place, :tourney2_place, :tourney3_place, :tourney4_place, :tourney5_place, :tourney6_place, :tourney7_place, :tourney8_place, :comments, :team_id)
  end

end
