class CreateSongs < ActiveRecord::Migration[5.0]
  def change
    create_table :songs do |t|
      t.string :name
      t.text :lyric
      t.string :file
      t.float :total_score, default: 0
      t.references :user, foreign_key: true
      t.references :genre, foreign_key: true
      t.references :artist, foreign_key: true

      t.timestamps
    end
  end
end
