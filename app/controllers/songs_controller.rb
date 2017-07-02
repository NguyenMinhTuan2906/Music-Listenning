class SongsController < ApplicationController
  before_action :logged_in_user, except: [:show]
  before_action :load_artist_genre, except: [:show, :index, :destroy]
  before_action :load_song, except: [:index, :new, :create]
  before_action :correct_user_song, only: [:edit, :update, :destroy]

  def index
    @songs = current_user.songs
  end

  def show
    return unless current_user
    @comment = current_user.comments.build
    @rating = @song.ratings.find_or_initialize_by user_id: current_user.id
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

  def edit
  end

  def update
    if @song.update_attributes song_params
      flash[:success] = t ".success"
      redirect_to @song
    else
      render :edit
    end
  end

  def destroy
    if @song.destroy
      flash[:success] = t ".delete"
    else
      flash[:danger] = t ".delete_fail"
    end
    redirect_to songs_url
  end

  private
  def song_params
    params.require(:song).permit :name, :lyric, :file, :artist_id,
      :genre_id, :picture
  end

  def load_artist_genre
    @artists = Artist.all.map{|artist| [artist.name, artist.id]}
    @genres = Genre.all.map{|genre| [genre.name, genre.id]}
  end

  def load_song
    @song = Song.find_by id: params[:id]
    return if @song
    flash[:danger] = t "none_song"
    redirect_to root_url
  end

  def correct_user_song
    return if current_user == @song.user
    flash[:danger] = t "can_not"
    redirect_to root_url
  end
end
