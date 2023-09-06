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

  has_one_attached :profile_image

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


  def get_profile_image(width, height)
  	unless profile_image.attached?
  		file_path = Rails.root.join('app/assets/images/UserImage.jpg')
  		profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpg')
  	end
  	  profile_image.variant(resize_to_limit: [width, height]).processed
  end

end
