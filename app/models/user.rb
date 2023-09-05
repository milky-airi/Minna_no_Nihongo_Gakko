class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :reviews, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_one :went_school
  has_many :reviews, dependent: :destroy

  def country
    Carmen::Country.coded(country_code)
  end

  # ゲストログイン用データ
  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "ゲスト"
      user.name_kana = "げすと"
      user.country_code = "JP"
      user.job = "大学生"
      user.is_deleted = false
    end
  end

end
