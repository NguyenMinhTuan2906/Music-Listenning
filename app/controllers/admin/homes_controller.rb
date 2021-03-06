class Admin::HomesController < ApplicationController
  before_action :logged_in_user, :verify_admin!
  layout "admin"

  def index
    @supports = Supports::AdminCount.new
  end
end
