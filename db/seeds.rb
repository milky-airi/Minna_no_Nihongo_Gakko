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

puts "seedの実行が完了しました"