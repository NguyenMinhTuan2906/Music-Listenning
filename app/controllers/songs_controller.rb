class SongsController < ApplicationController
  before_action :logged_in_user, except: [:show]
  before_action :load_artist_genre, only: [:new, :create]

  def show
    @song = Song.find_by id: params[:id]
  end

  def new
    @song = current_user.songs.build
  end

  def create
    @song = current_user.songs.build song_params
    if @song.save
      flash[:success] = t ".song_upload"
      redirect_to @song
    else
      render :new
    end
  end

  private
  def song_params
    params.require(:song).permit :name, :description, :file, :artist_id,
      :genre_id, :picture
  end

  def load_artist_genre
    @artists = Artist.all.map{|artist| [artist.name, artist.id]}
    @genres = Genre.all.map{|genre| [genre.name, genre.id]}
  end
end
