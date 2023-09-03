class Review < ApplicationRecord
  belongs_to :user
  belongs_to :school
  has_many :alerts, dependent: :destroy
  has_many :comments, dependent: :destroy
end
