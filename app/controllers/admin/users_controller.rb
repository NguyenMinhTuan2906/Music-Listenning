class Admin::UsersController < ApplicationController
  before_action :load_user, only: [:destroy]

  def destroy
    if @user.destroy
      flash[:success] = t ".delete"
    else
      flash[:danger] = t ".delete_fail"
    end
    redirect_to users_url
  end
end
