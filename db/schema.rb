# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170629015117) do

  create_table "artists", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "name"
    t.text     "description", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "comments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.text     "content",    limit: 65535
    t.integer  "user_id"
    t.integer  "song_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["song_id"], name: "index_comments_on_song_id", using: :btree
    t.index ["user_id"], name: "index_comments_on_user_id", using: :btree
  end

  create_table "genres", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "name"
    t.text     "description", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "ratings", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.float    "score",      limit: 24
    t.integer  "user_id"
    t.integer  "song_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.index ["song_id"], name: "index_ratings_on_song_id", using: :btree
    t.index ["user_id"], name: "index_ratings_on_user_id", using: :btree
  end

  create_table "songs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "name"
    t.text     "description", limit: 65535
    t.string   "file"
    t.float    "total_score", limit: 24
    t.integer  "user_id"
    t.integer  "genre_id"
    t.integer  "artist_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["artist_id"], name: "index_songs_on_artist_id", using: :btree
    t.index ["genre_id"], name: "index_songs_on_genre_id", using: :btree
    t.index ["user_id"], name: "index_songs_on_user_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "remember_digest"
  end

  add_foreign_key "comments", "songs"
  add_foreign_key "comments", "users"
  add_foreign_key "ratings", "songs"
  add_foreign_key "ratings", "users"
  add_foreign_key "songs", "artists"
  add_foreign_key "songs", "genres"
  add_foreign_key "songs", "users"
end
