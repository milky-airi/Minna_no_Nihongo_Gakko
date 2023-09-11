class Review < ApplicationRecord
  belongs_to :user
  belongs_to :school
  # belongs_to :went_school
  has_many :alerts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :notifications, dependent: :destroy

  validates :star_integer, presence: :true
  validates :evaluation_class, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
  validates :evaluation_after_graduation, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
  validates :evaluation_place, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
  validates :evaluation_facility, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
  validates :evaluation_student, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
  validates :evaluation_teacher, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
  validates :evaluation_life, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }


  # 通知作成
  def create_notification_by(current_user)
      notification = current_user.active_notifications.new(
        review_id: id,
        visited_id: user_id,
        action: "comment"
      )

  if notification.visiter_id == notification.visited_id
     notification.is_checked = true
  end

    notification.save if notification.valid?
  end


end
