class Admin::AlertsController < ApplicationController
  before_action :authenticate_admin!, only: [:index, :edit, :update]

  def index
    @alerts = Alert.all
  end

  def edit
    @alert = Alert.find(params[:id])
  end

  def update
    alert = Alert.find(params[:id])
    alert.update(alert_params)
    redirect_to admin_alerts_path
  end

  private

    def alert_params
      params.require(:alert).permit(:review_id, :user_id, :reason, :is_done)
    end

end
