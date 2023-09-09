class Admin::HomesController < ApplicationController
  def top
    @schools = School.all.page(params[:page]).per(10)
  end
end
