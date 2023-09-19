FactoryBot.define do
  factory :user do
    email { "test@example.com" }
    password { "password123" }
    name { "テストユーザ" }
    country_code { "JP" }
  end
end
