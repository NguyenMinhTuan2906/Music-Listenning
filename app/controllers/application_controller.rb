class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  private
  def verify_admin!
    return if current_user.is_admin?
    flash[:danger] = t "not_admin"
    redirect_to root_url
  end
end
