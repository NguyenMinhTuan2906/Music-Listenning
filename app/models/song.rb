class Song < ApplicationRecord
  belongs_to :user
  belongs_to :genre
  belongs_to :artist
end
