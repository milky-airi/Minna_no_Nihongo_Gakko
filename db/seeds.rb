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
  school.is_open = true
  school.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/SchoolImage.jpg"), filename:"SchoolImage.jpg")
end

puts "seedの実行が完了しました"