class TeamsController < ApplicationController
  respond_to  :html, :js

  def index
    @team = Team.new
    teams = Team.order('name ASC')
    respond_to do |format|
      format.html
      format.csv { send_data teams.to_csv }
      format.xls { send_data teams.to_csv(col_sep: "\t")}
    end
  end

  def new
    @team = Team.new
  end

  def create

    @team = Team.new(team_params)

    respond_to do |format|
      if @team.save
        format.html { redirect_to @team, notice: 'team was successfully created.' }
        format.json { render action: 'show', status: :created, location: @team }
        # added:
        format.js   { render action: 'show', status: :created, location: @team }
      else
        format.html { render action: 'new' }
        format.json { render json: @team.errors, status: :unprocessable_entity }
        # added:
        format.js   { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @team = Team.find(params[:id])
  end

  def show
    @teams = Team.order('name ASC')
    @team = Team.find(params[:id])
  end

  def update
    @teams = Team.order('ASC')
    @team = Team.find(params[:id])

    if @team.update(team_params)
      redirect_to '/teams'
    else
      render :edit
    end
  end

  def destroy
    @team = Team.find_by_id(params[:id])
    @team.destroy
    redirect_to teams_path
  end

  private


  def team_params
    params.require(:team).permit(:name, :section, :coach, :cell)
  end


end
