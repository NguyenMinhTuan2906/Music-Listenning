class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  include PagesHelper

  private

  def prevent_signup_loggin
    return unless current_user
    flash[:danger] = t "prevent_signup_loggin"
    redirect_to root_url
  end

  def verify_admin!
    return if current_user.is_admin?
    flash[:danger] = t "not_admin"
    redirect_to root_url
  end

  def load_user
    @user = User.find_by id: params[:id]
    return if @user
    flash[:danger] = t "none"
    redirect_to root_url
  end
end
