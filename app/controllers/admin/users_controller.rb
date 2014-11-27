class Admin::UsersController < ApplicationController
  

  before_action :load_user, only: [:show, :edit, :update]

  def index
    if current_user.admin == true
      @users = User.order("firstname").page(params[:page]).per(5)
    else
      redirect_to root_url, alert: "You don't have admin access"
    end
  end

  def new
    @user = User.new
  end

  def create
   params[:admin] == 1 ? params[:admin] = true : false
  
    @user = User.new(user_params)

    if @user.save
      redirect_to admin_users_path, notice: "You've created a user called #{@user.firstname}."
    else
      render :new
    end
  end

  def show
    # @user = User.find(params[:id])
  end

  def edit
    # @user = User.find(params[:id])
  end

  def update
    # @user = User.find(params[:id])

    if @user.update_attributes(user_params)
      redirect_to admin_users_path
    else
      redirect_to edit_admin_user_path, notice: "You suck at life."
    end
  end

  def destroy
    @user.destroy
    redirect_to admin_users_path, notice: "You've deleted #{@user.full_name}'s account."
  end

  protected

  def load_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :firstname, :lastname, :password, :password_confirmation, :admin)
  end

end