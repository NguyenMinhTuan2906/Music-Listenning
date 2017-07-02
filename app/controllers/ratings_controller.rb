class RatingsController < ApplicationController
  before_action :logged_in_user, only: [:create]

  def create
    @rating = current_user.ratings.build rating_params
    if @rating.save
      render json: {
        new_score: @rating.song.total_score.round(2),
        rating_id: @rating.id
      }, status: :ok
    else
      render errors, status: :unauthorized
    end
  end

  private
  def rating_params
    params.require(:rating).permit :score, :song_id
  end
end
