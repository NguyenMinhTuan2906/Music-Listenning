class Artist < ApplicationRecord
  has_many :songs, dependent: :destroy
  validates :name, presence: true, uniqueness: {case_sensitive: false},
    length: {maximum: Settings.artistname.maximum}
  validates :description, presence: true
  scope :search, ->search{where "name LIKE ?", "%#{search}%"}
end
