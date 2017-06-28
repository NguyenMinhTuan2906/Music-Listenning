class User < ApplicationRecord
  has_many :comments
  has_many :songs
  has_many :ratings
end
