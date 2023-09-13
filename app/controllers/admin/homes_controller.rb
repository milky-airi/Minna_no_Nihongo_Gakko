class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!, only: [:top]

  def top
    @schools = School.all.page(params[:page]).per(10).order(created_at: :desc)
  end
end
