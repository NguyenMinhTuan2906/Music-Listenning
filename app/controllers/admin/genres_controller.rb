class Admin::GenresController < ApplicationController
  before_action :logged_in_user, :verify_admin!
  before_action :load_genre, except: [:new, :create, :index]
  before_action :load_page, only: [:index]
  layout "admin"

  def index
    if request.xhr?
      @genres = Genre.search(params[:name]).includes(:songs).select(:id, :name)
        .order(name: :asc).paginate page: params[:page]
      render json: {
        search_result: render_to_string(@genres)
      }, status: :ok
    else
      @genres = Genre.includes(:songs).select(:id, :name).order(name: :asc)
        .paginate page: params[:page]
    end
  end

  def show
    @songs = @genre.songs.paginate page: params[:page],
      per_page: Settings.paginate.per_page
  end

  def new
    @genre = Genre.new
  end

  def create
    @genre = Genre.new genre_params
    if @genre.save
      flash[:success] = t ".success"
      redirect_to admin_genres_url
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @genre.update_attributes genre_params
      flash[:success] = t ".success"
      redirect_to admin_genre_url(@genre)
    else
      render :edit
    end
  end

  def destroy
    if @genre.destroy
      flash[:success] = t ".success"
    else
      flash[:danger] = t ".fail"
    end
    redirect_to admin_genres_url
  end

  private
  def genre_params
    params.require(:genre).permit :name, :description
  end

  def load_genre
    @genre = Genre.find_by id: params[:id]
  end
end
