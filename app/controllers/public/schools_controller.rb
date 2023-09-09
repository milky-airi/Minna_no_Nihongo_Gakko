class Public::SchoolsController < ApplicationController

  def show
    @school = School.find(params[:id])
    @courses = @school.courses
  end

end
