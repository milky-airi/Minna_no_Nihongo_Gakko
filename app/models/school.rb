class School < ApplicationRecord
  has_many :favorites, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :courses, dependent: :destroy
  has_many :student_nationality_taggings, dependent: :destroy
  has_many :student_nationality_tags, through: :student_nationality_taggings
  has_many :went_schools, dependent: :destroy

  has_one_attached :image

  # ひらがな・カタカナの正規表現
  KANA_REGEX = /\A[\p{katakana}\p{hiragana}\u{30fc}]+\z/
  validates :name_kana, format: { with: KANA_REGEX, message: 'はひらがなかカタカナで入力してください' }
  # アルファベットのみの正規表現
  ENGLISH_REGEX = /\A[a-zA-Z\s]+\z/
  validates :name_en, format: { with: ENGLISH_REGEX, message: 'はアルファベットで入力してください' }

  enum prefecture:{
     北海道:1,青森県:2,岩手県:3,宮城県:4,秋田県:5,山形県:6,福島県:7,
     茨城県:8,栃木県:9,群馬県:10,埼玉県:11,千葉県:12,東京都:13,神奈川県:14,
     新潟県:15,富山県:16,石川県:17,福井県:18,山梨県:19,長野県:20,
     岐阜県:21,静岡県:22,愛知県:23,三重県:24,
     滋賀県:25,京都府:26,大阪府:27,兵庫県:28,奈良県:29,和歌山県:30,
     鳥取県:31,島根県:32,岡山県:33,広島県:34,山口県:35,
     徳島県:36,香川県:37,愛媛県:38,高知県:39,
     福岡県:40,佐賀県:41,長崎県:42,熊本県:43,大分県:44,宮崎県:45,鹿児島県:46,
     沖縄県:47
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
    @schools = School.where("name LIKE ?", "%#{word}%") + School.where("name_kana LIKE ?", "%#{word}%") + School.where("name_en LIKE ?", "%#{word}%")
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

end
