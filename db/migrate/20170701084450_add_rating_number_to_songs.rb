class AddRatingNumberToSongs < ActiveRecord::Migration[5.0]
  def change
    add_column :songs, :rating_number, :integer, default: 0
  end
end
