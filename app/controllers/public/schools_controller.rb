class Public::SchoolsController < ApplicationController

  def show
    @school = School.find(params[:id])
    @courses = @school.courses
    @reviews = @school.reviews.where(is_open: true).page(params[:page]).per(10).order(created_at: :desc)

  end

end
