class Public::HomesController < ApplicationController
  def top
    @schools = School.where(is_open: true)
    @top_review_schools = School.where(is_open: true).order(params[:sort]).limit(4)
  end
end
