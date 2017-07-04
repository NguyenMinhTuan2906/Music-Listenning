class Admin::ArtistsController < ApplicationController
  before_action :logged_in_user, :verify_admin!
  before_action :load_artist, except: [:new, :create, :index]
  before_action :load_page, only: [:index]
  layout "admin"

  def index
    if request.xhr?
      @artists = Artist.search(params[:name]).includes(:songs).select(:id, :name)
        .order(name: :asc).paginate page: params[:page], per_page: Settings.paginate.per_page
      render json: {
        search_result: render_to_string(@artists)
      }, status: :ok
    else
      @artists = Artist.includes(:songs).select(:id, :name).order(name: :asc)
        .paginate page: params[:page], per_page: Settings.paginate.per_page
    end
  end

  def show
    @songs = @artist.songs.includes(:artist, :genre)
      .select(:id, :name, :artist_id, :user_id, :genre_id, :picture, :file, :total_score)
      .order(name: :asc).paginate page: params[:page],
      per_page: Settings.paginate.per_page
  end

  def new
    @artist = Artist.new
  end

  def create
    @artist = Artist.new artist_params
    if @artist.save
      flash[:success] = t ".success"
      redirect_to admin_artists_url
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @artist.update_attributes artist_params
      flash[:success] = t ".success"
      redirect_to admin_artist_url(@artist)
    else
      render :edit
    end
  end

  def destroy
    if @artist.destroy
      flash[:success] = t ".success"
    else
      flash[:danger] = t ".fail"
    end
    redirect_to admin_artists_url
  end

  private
  def artist_params
    params.require(:artist).permit :name, :description
  end

  def load_artist
    @artist = Artist.find_by id: params[:id]
  end
end
