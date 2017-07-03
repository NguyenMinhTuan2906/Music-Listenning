class Supports::AdminCount
  def songs_count
    @songs_count ||= Song.select(:id).size
  end

  def artists_count
    @artists_count ||= Artist.select(:id).size
  end

  def genres_count
    @genres_count ||= Genre.select(:id).size
  end

  def users_count
    @users_count ||= User.where(is_admin: false).size
  end
end
