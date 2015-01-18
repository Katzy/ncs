class UsersController < ApplicationController

  before_filter :authorize_admin, only: :create

  def index
    @users = User.order('name Asc')
    users = User.order('name Asc')
    respond_to do |format|
      format.html
      format.csv { send_data users.to_csv }
      format.xls { send_data users.to_csv(col_sep: "\t")}
    end
  end

  def new
    @user = User.new
    @teams = Team.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @users = User.order('name ASC')
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to users_path
    else
      render :edit
    end
  end

  def create
    @teams = Team.all
     @user = User.create(user_params)
    if @user.persisted?
      redirect_to root_url, notice: "User was successfully created"
    else
      render :new
    end
  end

  def show
  end

  def destroy
    @users = User.order('name ASC')
    @user = User.find_by_id(params[:id])
    @user.destroy
    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit(:email, :name, :password, :password_confirmation, :team_id)
  end

end
