class TeamsController < ApplicationController

  def index
    @teams = Team.order('name ASC')
  end

  def new
    @team = Team.new
  end

  def create
    @team = Team.create(team_params)
    p params
    if @team.persisted?
      flash[:notice] = "You just created a team.  Great work!"
      redirect_to teams_path(@team)
    else
      render :new
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
