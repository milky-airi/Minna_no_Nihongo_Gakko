class Admin::AlertsController < ApplicationController
  before_action :authenticate_admin!, only: [:index, :edit, :update]

  def index
    @alerts = Alert.all.page(params[:page]).per(10).order(created_at: :desc)
  end

  def edit
    @alert = Alert.find(params[:id])
  end

  def update
    alert = Alert.find(params[:id])
    if alert.update(alert_params)
      flash[:notice] = "通報情報を更新しました"
      redirect_to admin_alerts_path
    else
      @alert = Alert.find(params[:id])
      flash[:alert] = review.errors.full_messages.join(", ")
      render :edit
    end
  end

  private

    def alert_params
      params.require(:alert).permit(:review_id, :user_id, :reason, :is_done)
    end

end
