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

# テストデータの挿入
require "csv"

# - - - - - - - - - - 日本語学校情報 - - - - - - - - - -

CSV.foreach('db/csv/schools.csv', headers: true) do |row|
  School.create!(
    id: row['id'],
    name: row['name'],
    name_kana: row['name_kana'],
    name_en: row['name_en'],
    summary: row['summary'],
    station: row['station'],
    prefecture: row['prefecture'],
    address: row['address'],
    building: row['building'],
    hp: row['hp'],
    facebook: row['facebook'],
    twitter: row['twitter'],
    instagram: row['instagram'],
    tiktok: row['tiktok'],
    youtube: row['youtube'],
    condition: row['condition'],
    anual_fee: row['anual_fee'],
    have_dormitory: row['have_dormitory'],
    dormitory_fee: row['dormitory_fee'],
    is_open: row['is_open'],
    image_from: row['image_from'],
    capacity: row['capacity']
  )
end

# - - - - - - - - - - コース情報 - - - - - - - - - -

CSV.foreach('db/csv/courses.csv', headers: true) do |row|
  Course.create!(
    school_id: row['school_id'],
    name: row['name'],
    admission_month: row['admission_month'],
    duration: row['duration']
  )
end

# - - - - - - - - - - 学生の国籍タグ - - - - - - - - - -

CSV.foreach('db/csv/student_nationality_tags.csv', headers: true) do |row|
  StudentNationalityTag.create!(
    id: row['id'],
    nationality: row['nationality']
  )
end

# - - - - - - - - - - 学生の国籍タグづけ - - - - - - - - - -

CSV.foreach('db/csv/student_nationality_taggings.csv', headers: true) do |row|
  StudentNationalityTagging.create!(
    school_id: row['school_id'],
    student_nationality_tag_id: row['student_nationality_tag_id']
  )
end

# - - - - - - - - - - ユーザー情報 - - - - - - - - - -

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

jonh = User.find_or_create_by!(email: "jonh@example.com") do |user|
  user.id = 2
  user.name = "Jonh Smith"
  user.country_code = "US"
  user.job = "会社員"
  user.password = "Jonhsmith"
  user.is_deleted = false
  user.confirmed_at = Time.now
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/jonh.jpg"), filename:"jonh.jpg")
end

# - - - - - - - - - - 出身校情報 - - - - - - - - - -

hanako_went_school = WentSchool.find_or_create_by!(user_id: 1) do |went_school|
  went_school.school_id = 1
  went_school.user_id = 1
  went_school.graduate_year = 2022
  went_school.graduate_month = 3
end

jonh_went_school = WentSchool.find_or_create_by!(user_id: 2) do |went_school|
  went_school.school_id = 2
  went_school.user_id = 2
  went_school.graduate_year = 2023
  went_school.graduate_month = 3
end

# - - - - - - - - - - レビュー情報 - - - - - - - - - -

CSV.foreach('db/csv/reviews.csv', headers: true) do |row|
  Review.create!(
    user_id: row['user_id'],
    school_id: row['school_id'],
    star_integer: row['star_integer'],
    comment_integer: row['comment_integer'],
    evaluation_class: row['evaluation_class'],
    comment_class: row['comment_class'],
    evaluation_after_graduation: row['evaluation_after_graduation'],
    comment_after_graduation: row['comment_after_graduation'],
    evaluation_place: row['evaluation_place'],
    comment_place: row['comment_place'],
    evaluation_facility: row['evaluation_facility'],
    comment_facility: row['comment_facility'],
    evaluation_student: row['evaluation_student'],
    comment_student: row['comment_student'],
    evaluation_teacher: row['evaluation_teacher'],
    comment_teacher: row['comment_teacher'],
    evaluation_life: row['evaluation_life'],
    comment_life: row['comment_life'],
    is_open: row['is_open']
  )
end

puts "seedの実行が完了しました"