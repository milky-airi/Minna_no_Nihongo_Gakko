class Alert < ApplicationRecord
  belongs_to :review
  belongs_to :user

  validates :reason, presence: :true
end
