class School < ApplicationRecord
  geocoded_by :full_address
  after_validation :geocode

  has_many :favorites, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :courses, dependent: :destroy
  has_many :student_nationality_taggings, dependent: :destroy
  has_many :student_nationality_tags, through: :student_nationality_taggings
  has_many :went_schools, dependent: :destroy

  has_one_attached :image

  validates :name, presence: true, uniqueness: true

  # ひらがな・カタカナの正規表現
  KANA_REGEX = /\A[\p{katakana}\p{hiragana}\u{30fc}]+\z/
  validates :name_kana, format: { with: KANA_REGEX, message: 'はひらがなかカタカナで入力してください' }
  # アルファベットのみの正規表現
  ENGLISH_REGEX = /\A[a-zA-Z\s&]+\z/
  validates :name_en, format: { with: ENGLISH_REGEX, message: 'はアルファベットで入力してください' }

  enum prefecture:{
     Hokkaido:1,Aomori:2,Iwate:3,Miyagi:4,Akita:5,Yamagata:6,Fukushima:7,
     Ibaraki:8,Tochigi:9,Gunma:10,Saitama:11,Chiba:12,Tokyo:13,Kanagawa:14,
     Nigata:15,Toyama:16,Ishikawa:17,Fukui:18,Yamanashi:19,Nagano:20,
     Gifu:21,Shizuoka:22,Aichi:23,Mie:24,
     Shiga:25,Kyoto:26,Osaka:27,Hyogo:28,Nara:29,Wakayama:30,
     Tootori:31,Shimane:32,Okayama:33,Hiroshima:34,Yamaguchi:35,
     Tokushima:36,Kagawa:37,Ehime:38,Kochi:39,
     Fukuoka:40,Saga:41,Nagasaki:42,Kumamoto:43,Oita:44,Miyazaki:45,Kagoshima:46,
     Okinawa:47
   }

   validates :prefecture, inclusion: { in: School.prefectures.keys, message: '有効な都道府県を選択してください' }

  def create_tags(input_tags)
     input_tags.each do |tag|
       new_tag = StudentNationalityTag.find_or_create_by(nationality: tag)
       student_nationality_tags << new_tag
     end
  end

  def update_tags(input_tags)
    registered_tags = student_nationality_tags.pluck(:nationality)
    new_tags = input_tags - registered_tags
    destroy_tags = registered_tags - input_tags

    new_tags.each do |tag|
      new_tag = StudentNationalityTag.find_or_create_by(nationality: tag)
      student_nationality_tags << new_tag
    end

    destroy_tags.each do |tag|
      tag_id = StudentNationalityTag.find_by(nationality: tag)
      destroy_tagging = StudentNationalityTagging.find_by(student_nationality_tag_id: tag_id, school_id: id)
      destroy_tagging.destroy
    end
  end

  def favorited_by?(user)
	  favorites.exists?(user_id: user.id)
  end

  def reviewed_by?(user)
    reviews.exists?(user_id: user.id)
  end

  def self.look_for(word)
    School.where("name LIKE ? OR name_kana LIKE ? OR name_en LIKE ?", "%#{word}%", "%#{word}%", "%#{word}%")
  end

  def self.look_detail_for(prefecture, nationalities, anual_fee_greater_than_or_equal, anual_fee_less_than, word)
    schools = School.all
    if prefecture.present?
      schools = schools.where(prefecture: prefecture)
    end

    if nationalities.present?
      schools = schools.joins(:student_nationality_tags).where(student_nationality_tags: { nationality: nationalities }).distinct
    end

    if anual_fee_greater_than_or_equal.present?
      schools = schools.where("anual_fee >= ?", anual_fee_greater_than_or_equal)
    end

    if anual_fee_less_than.present?
      schools = schools.where("anual_fee < ?", anual_fee_less_than)
    end

    if word.present?
      # schools = School.where("name LIKE ?", "%#{word}%") + School.where("name_kana LIKE ?", "%#{word}%") + School.where("name_en LIKE ?", "%#{word}%")
      schools = schools.where("name LIKE ?", "%#{word}%").or(schools.where("name_kana LIKE ?", "%#{word}%")).or(schools.where("name_en LIKE ?", "%#{word}%"))
    end
    return schools
  end

  def self.look_prefecture_for(prefecture)
    where(prefecture: prefecture)
  end

  def get_image(width, height)
  	unless image.attached?
  		file_path = Rails.root.join('app/assets/images/SchoolImage.jpg')
  		image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpg')
  	end
  	  image.variant(resize_to_limit: [width, height]).processed
  end

  def full_address
    [prefecture, address].compact.join(' ')
  end

end
