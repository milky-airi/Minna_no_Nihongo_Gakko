class Public::AlertsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :thanks]

  def new
    @review = Review.find(params[:review_id])
  end

  def create
    alert = Alert.new(alert_params)
    alert.user_id = current_user.id
    alert.review_id = params[:review_id]
    if alert.save
      redirect_to thanks_alerts_path
    else
      flash[:alert] = "通報の作成に失敗しました"
      redirect_to review_path(params[:review_id])
    end
  end

  def thanks
  end

  private

    def alert_params
      params.require(:alert).permit(:review_id, :user_id, :reason, :is_done)
    end
end
