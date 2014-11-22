class TeamsController < ApplicationController

  def index
    @teams = Team.order('name ASC')
    @team = Team.new
  end

  def new
    @team = Team.new
  end

  def create

    @team = Team.new(team_params)

    respond_to do |format|
      if @team.save
        format.html { redirect_to @pteam, notice: 'team was successfully created.' }
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
    @team = Team.find(params[:id])
  end

  def update
    @team = Team.find(params[:id])

    if @team.update(team_params)
      redirect_to @team
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
