class Song < ApplicationRecord
  belongs_to :user
  belongs_to :genre
  belongs_to :artist
  mount_uploader :file, FileUploader
  mount_uploader :picture, PictureUploader

  validates :name, presence: true
  validates :description, presence: true
  validates :file, presence: true
  validates :picture, presence: true
end
