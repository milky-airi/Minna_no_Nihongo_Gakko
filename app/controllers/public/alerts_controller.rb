class Public::AlertsController < ApplicationController

  def new
    @review = Review.find(params[:review_id])
  end

  def create
    alert = Alert.new(alert_params)
    alert.user_id = current_user.id
    alert.review_id = params[:review_id]
    alert.save
    redirect_to thanks_alerts_path
  end

  def thanks
  end

  private

    def alert_params
      params.require(:alert).permit(:review_id, :user_id, :reason, :is_done)
    end
end
