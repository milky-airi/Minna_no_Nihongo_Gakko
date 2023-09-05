class Public::AlertsController < ApplicationController

  def new
  end

  def create
    alert = Alert.new(alert_params)
    alert.user_id = current_user.id
    alert.save
    redirect_to alerts_thanks_path
  end

  def thanks
  end

  private

    def alert_params
      params.require(:alert).permit(:review_id, :user_id, :reason, :is_done)
    end
end
