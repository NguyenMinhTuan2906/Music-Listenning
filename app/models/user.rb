class User < ApplicationRecord
  before_save :email_downcase
  has_many :comments
  has_many :songs
  has_many :ratings

  validates :name, presence: true, length: {maximum: Settings.username.maximum}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: Settings.email.maximum},
    format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}
  validates :password, presence: true, length: {minimum: Settings.password.minimum},
    allow_nil: true
  has_secure_password

  private
  def email_downcase
    email.downcase!
  end
end
