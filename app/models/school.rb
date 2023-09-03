class School < ApplicationRecord
  has_many :users, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :courses, dependent: :destroy
end
