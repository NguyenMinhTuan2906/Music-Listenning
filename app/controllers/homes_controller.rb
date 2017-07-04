class HomesController < ApplicationController
  def home
    @genres = Genre.includes(:songs).select(:id, :name)
  end
end
