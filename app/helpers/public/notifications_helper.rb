module Public::NotificationsHelper

  def unchecked_notifications
    # @notifications = current_user.passive_notifications.where(is_checked: false)
    current_user.passive_notifications.where(is_checked: false)
  end

end
