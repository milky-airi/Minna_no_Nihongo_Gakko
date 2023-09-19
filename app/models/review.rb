class Review < ApplicationRecord
  belongs_to :user
  belongs_to :school
  has_many :alerts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :notifications, dependent: :destroy
  has_many :nice_reviews, dependent: :destroy

  validates :star_integer, presence: :true
  validates :evaluation_class, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
  validates :evaluation_after_graduation, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
  validates :evaluation_place, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
  validates :evaluation_facility, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
  validates :evaluation_student, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
  validates :evaluation_teacher, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
  validates :evaluation_life, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }

  # コメント通知
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

  #いいね通知
  def create_nice_notification_by(current_user)
      notification = current_user.active_notifications.new(
        review_id: id,
        visited_id: user_id,
        action: "nice"
      )

    if notification.visiter_id == notification.visited_id
       notification.is_checked = true
    end

    notification.save if notification.valid?
  end

  # レビューいいね済みかどうか確認
  def niced_by?(user)
	  nice_reviews.exists?(user_id: user.id)
  end

end
