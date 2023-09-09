class Admin::HomesController < ApplicationController
  def top
    @schools = School.all.page(params[:page]).per(10).order(created_at: :desc)
  end
end
