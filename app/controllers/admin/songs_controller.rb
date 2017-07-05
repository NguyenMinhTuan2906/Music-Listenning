class Admin::SongsController < ApplicationController
  before_action :logged_in_user, :verify_admin!
  before_action :load_page, only: [:index]
  layout "admin"

  def index
    if request.xhr?
      @songs = Song.search(params[:name]).includes(:artist, :genre)
        .select(:id, :name, :artist_id, :user_id, :genre_id, :picture, :file)
        .order(name: :asc).paginate page: params[:page],
        per_page: Settings.paginate.per_page
      render json: {
        search_result: render_to_string(@songs)
      }, status: :ok
    else
      @songs = Song.includes(:artist, :genre)
        .select(:id, :name, :artist_id, :user_id, :genre_id, :picture, :file)
        .order(name: :asc).paginate page: params[:page],
        per_page: Settings.paginate.per_page
    end
  end

  def destroy
    @song = Song.find_by id: params[:id]
    if @song.destroy
      flash[:success] = t ".delete"
    else
      flash[:danger] = t ".delete_fail"
    end
    redirect_to admin_songs_url
  end
end
