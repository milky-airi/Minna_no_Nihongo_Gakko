class Public::NotificationsController < ApplicationController

  def index
    # @notifications = current_user.passive_notifications.(params[:page]).per(20)
    @notifications = current_user.passive_notifications.page(params[:page]).per(20)
    @notifications.where(is_checked: false).each do |notification|
      # notification.update_attributes(is_checked: true)
      notification.update(is_checked: true)
    end
  end

  def destroy
    # 通知を全削除
    @notifications = current_user.passive_notifications.destroy_all
    redirect_to notifications_path
  end

end
