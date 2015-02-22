class UsersController < ApplicationController

  before_filter :authorize_admin, only: :create

  before_filter :skip_password_attribute, :only => [:edit, :update]

  def home
    @user = current_user
    @wrestlers = @user.wrestlers.order('weight ASC')
    @wrestler = @user.wrestlers.new

  end

  # def send
  #   @users = User.all
  #   @users.each do |user|
  #     UserMailer.new_user(user).deliver
  #   end
  #     redirect_to root_url
  # end



  def index
    @users = User.order('league Asc')
    users = User.order('league Asc')
    respond_to do |format|
      format.html
      format.csv { send_data users.to_csv }
      format.xls { send_data users.to_csv(col_sep: "\t")}
    end
  end

  def new
    @user = User.new
    @teams = Team.all
    @list = ['C', 'CC', 'LA', 'N', 'NC', 'O', 'S', 'SD', 'SF', 'SJ', 'OTHER SCHOOLIO']
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
        redirect_to user_wrestlers_path(@user)
      end
    else
      render :edit
    end
  end

  def create
     @user = User.create(user_params)
    if @user.persisted?
      # @team = Team.new
      # @team.school = @user.school
      # @team.user_id = @user.id
      # @team = Team.create(team_params)
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
    # @tournaments = @user.tournaments.all
    # @wrestlers = @user.wrestlers.all
    # @wrestlers.destroy
    # @tournaments.destroy
    @user.destroy
    redirect_to users_path
  end

  private

  def skip_password_attribute
    if params[:password].blank? && params[:password_validation].blank?
      params.except!(:password, :password_validation)
    end
  end

  def user_params
    params.require(:user).permit(:email, :name, :password, :password_confirmation, :cell, :league)
  end

end
