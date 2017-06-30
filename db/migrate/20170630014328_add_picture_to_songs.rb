class AddPictureToSongs < ActiveRecord::Migration[5.0]
  def change
    add_column :songs, :picture, :string
  end
end
