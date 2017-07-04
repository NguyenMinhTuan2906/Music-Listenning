class GenresController < ApplicationController
  def index
    @genres = Genre.includes(:songs).select(:id, :name).order(name: :asc)
      .paginate page: params[:page], per_page: Settings.paginate.per_page
  end

  def show
    @genre = Genre.find_by id: params[:id]
    @songs = @genre.songs.includes(:artist, :genre)
      .select(:id, :name, :artist_id, :user_id, :genre_id, :picture, :file, :total_score)
      .order(name: :asc).paginate page: params[:page],
      per_page: Settings.paginate.per_page
  end
end
