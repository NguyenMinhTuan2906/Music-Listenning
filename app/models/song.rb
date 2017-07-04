class Song < ApplicationRecord
  belongs_to :user
  belongs_to :genre
  belongs_to :artist
  has_many :comments, dependent: :destroy
  has_many :ratings, dependent: :destroy
  mount_uploader :file, FileUploader
  mount_uploader :picture, PictureUploader

  validates :name, presence: true,
    length: {maximum: Settings.songname.maximum}
  validates :lyric, presence: true
  validates :file, presence: true
  validates :picture, presence: true

  scope :search, ->search{where "name LIKE ?", "%#{search}%"}
end
