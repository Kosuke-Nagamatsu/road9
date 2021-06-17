class User < ApplicationRecord
  has_many :feeds
  has_many :favorites, dependent: :destroy
  mount_uploader :image, ImageUploader
  validates :name, presence: true, length: { maximum: 30 }
  validates :birthday, presence: true
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: true
  before_validation { email.downcase! }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
end
