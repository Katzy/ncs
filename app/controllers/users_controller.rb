class UsersController < ApplicationController

  before_filter :authorize_admin, only: :create
  before_filter :authenticate_user!, :only => [:edit, :update]

  # SECTIONS = [C, CCS, LA, NCS, N, O, S, SD, SF, SJ, OTHER]

  def home
    @user = current_user
    @wrestlers = @user.wrestlers.order('weight ASC')
    @wrestler = @user.wrestlers.new
  end

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
      if current_user.admin?
        redirect_to users_path
      else
        redirect_to users_home_path
      end
    else
      render :edit
    end
  end

  def create
     @user = User.create(user_params)
    if @user.persisted?
      UserMailer.new_user(@user).deliver
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
    params.require(:user).permit(:email, :name, :password, :password_confirmation, :school, :abbreviation, :cell, :section)
  end

end
