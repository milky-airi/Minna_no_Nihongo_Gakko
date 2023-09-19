class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :rememberable, :validatable, :confirmable

  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_one :went_school, dependent: :destroy
  has_one :review, dependent: :destroy
  has_many :active_notifications, class_name: 'Notification', foreign_key: 'visiter_id', dependent: :destroy
  has_many :passive_notifications, class_name: 'Notification', foreign_key: 'visited_id', dependent: :destroy
  has_many :nice_reviews, dependent: :destroy

  validates :name, presence: true
  validates :country_code, presence: true

  def validate_country_code
    unless Carmen::Country.coded(country_code)
      errors.add(:country_code, 'は有効な国コードではありません')
    end
  end

  has_one_attached :profile_image

  def country
    Carmen::Country.coded(country_code)
  end

  # ゲストログイン用メソッド
  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "ゲスト"
      user.country_code = "JP"
      user.job = "大学生"
      user.is_deleted = false
      user.confirmed_at = Time.now
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
