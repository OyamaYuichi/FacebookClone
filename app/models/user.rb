class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable,
          # Omniauthを使用するためのオプション
          :omniauthable, omniauth_providers: %i[facebook google_oauth2]

  validates :name,  presence: true, length: { maximum: 30 }
  validates :email, presence: true, length: { maximum: 255 }, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :password, presence: true, length: { minimum: 6 }
  before_validation { email.downcase! }
  has_secure_password
  has_many :feeds
  has_many :sns_credential, dependent: :destroy
end
