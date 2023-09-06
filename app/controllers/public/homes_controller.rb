class Public::HomesController < ApplicationController
  def top
    @schools = School.where(is_open: true)
    @top_review_schools = School.where(is_open: true).order(params[:sort]).limit(4)
    @reviews = Review.all.last(4)
  end
end
