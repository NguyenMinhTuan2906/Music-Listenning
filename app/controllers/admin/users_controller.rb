class Admin::UsersController < ApplicationController
  before_action :verify_admin!, :logged_in_user
  before_action :load_user, only: [:show, :destroy]
  before_action :load_page, only: [:index]
  layout "admin"

  def index
    if request.xhr?
      @users = User.reject_admin.search(params[:name]).includes(:songs)
        .select(:id, :name, :email).order(name: :asc).paginate page: params[:page],
        per_page: Settings.paginate.per_page
      render json: {
        search_result: render_to_string(@users)
      }, status: :ok
    else
      @users = User.reject_admin.includes(:songs).select(:id, :name, :email)
        .order(name: :asc).paginate page: params[:page],
        per_page: Settings.paginate.per_page
    end
  end

  def destroy
    if @user.destroy
      flash[:success] = t ".delete"
    else
      flash[:danger] = t ".delete_fail"
    end
    redirect_to admin_users_url
  end
end
