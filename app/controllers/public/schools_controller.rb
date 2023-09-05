class Public::SchoolsController < ApplicationController
  def index
  end

  def show
    @school = School.find(params[:id])
    @courses = @school.courses
  end



end
