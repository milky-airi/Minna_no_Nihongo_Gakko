# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "seedの実行を開始"

Admin.create!(
  email: ENV['ADMIN'],
  password: ENV['ADMIN_PASSWORD']
)

hanako = User.find_or_create_by!(email: "hanako@example.com") do |user|
  user.id = 1
  user.name = "田中花子"
  user.country_code = "JP"
  user.job = "大学生"
  user.password = "Tanakahanako"
  user.is_deleted = false
  user.confirmed_at = Time.now
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/hanako.jpg"), filename:"hanako.jpg")
end

asahikawa = School.find_or_create_by!(name: "旭川福祉専門学校") do |school|
  school.id = 1
  school.name = "旭川福祉専門学校"
  school.name_kana = "あさひかわふくしせんもんがっこう"
  school.name_en = "Asahikawa Welfare College"
  school.station = "千代ヶ丘駅"
  school.prefecture = "Hokkaido"
  school.address = "上川郡東川町進化台"
  school.hp = "https://www.hokko.ac.jp/kyokufuku/"
  school.twitter = "https://twitter.com/fukusen_renger"
  school.instagram = "https://www.instagram.com/fukusenkoho/"
  school.anual_fee = 600000
  school.is_open = true
  school.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/SchoolImage.jpg"), filename:"SchoolImage.jpg")
end

asahikawa_course = Course.find_or_create_by!(name: "1年6か月課程") do |course|
  course.school_id = 1
  course.name = "1年6か月課程"
  course.admission_month = 4
  course.duration = 18
end

hanako_went_school = WentSchool.find_or_create_by!(user_id: 1) do |went_school|
  went_school.school_id = 1
  went_school.user_id = 1
  went_school.graduate_year = 2022
  went_school.graduate_month = 3
end

hanako_review = Review.find_or_create_by!(user_id: 1) do |review|
  review.user_id = 1
  review.school_id = 1
  review.star_integer = 5
  review.comment_integer = "雰囲気が良くて、とても素敵な学校です！"
  review.evaluation_class = 3
  review.comment_class = "授業は難しいですが、ためになります"
  review.evaluation_after_graduation = 4
  review.comment_after_graduation = "卒業後、行きたかった専門学校へ行くことができました"
  review.evaluation_place = 2
  review.comment_place = "場所はあまり便利ではありませんでした"
  review.evaluation_facility = 3
  review.comment_facility = "設備は普通でした"
  review.evaluation_student = 5
  review.comment_student = "学生はみんないい人ばかりでした"
  review.evaluation_teacher = 5
  review.comment_teacher = "先生は厳しいですが、とても親切でした"
  review.evaluation_life = 4
  review.comment_life = "時々行事があって、日本人と会話する機会がありました"
  review.is_open = true
end

puts "seedの実行が完了しました"