class User < ApplicationRecord
  validates :name, presence: true, length: {maximum: 15}
  EM_REGEX = /[A-Za-z0-9._+]+@[A-Za-z]+.[A-Za-z]/
  validates :email, presence: true, format: { with: EM_REGEX }

  # validates :password, length: {in: 8..32}
  # PW_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{8,32}\z/i
  # PW_REGEX = /^[a-z\d]{8,32}$/i
  PW_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{8,32}\z/i
  validates :password, presence: true, format: { with: PW_REGEX }

  has_secure_password

  has_many :topics
  has_many :favorites
  has_many :favorite_topics, through: :favorites, source: 'topic'

  has_many :comments
  has_many :comment_topics, through: :comment, source: 'topic'

  end
