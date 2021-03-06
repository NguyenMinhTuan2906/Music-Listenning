class UsersController < ApplicationController
  before_action :load_user, except: [:new, :index, :create]
  before_action :logged_in_user, only: [:edit, :update, :index]
  before_action :correct_user, only: [:edit, :update]
  before_action :prevent_signup_loggin, only: [:new, :create]
  before_action :verify_admin!, only: [:index]

  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      log_in @user
      flash[:success] = t ".welcome"
      redirect_to @user
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update_attributes user_params
      flash[:success] = t ".success"
      redirect_to @user
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit :name, :email, :password,
      :password_confirmation
  end

  def correct_user
    return if @user.is_user? current_user
    flash[:danger] = t "can_not"
    redirect_to root_url
  end
end
