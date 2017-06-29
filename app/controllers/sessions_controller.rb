class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by email: params[:session][:email].downcase
    if user && user.authenticate(params[:session][:password])
      log_in user
      params[:session][:remember_me] == "1" ? remember(user) : forget(user)
      flash[:success] = t(".welcome") + user.name + "."
      redirect_back_or
    else
      flash.now[:danger] = t ".invalid"
      render :new
    end
  end

  def destroy
    log_out
    flash[:info] = t ".bye"
    redirect_to root_url
  end
end
