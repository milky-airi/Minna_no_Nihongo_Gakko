class Admin::CoursesController < ApplicationController
  before_action :authenticate_admin!

  def new
    @course = Course.new
  end

  def create
    course = Course.new(course_params)
    course.save
    redirect_to admin_school_path(course.school_id)
  end

  def edit
    @course = Course.find(params[:id])
  end

  def update
    course = Course.find(params[:id])
    course.update(course_params)
    redirect_to admin_courses_path
  end

  def index
    @courses = Course.all
  end

  def show
    @course = Course.find(params[:id])
  end

  def destroy
    course = Course.find(params[:id])
    course.destroy
    redirect_to admin_school_path(course.school_id)
  end

  private

    def course_params
      params.require(:course).permit(:school_id, :name, :admission_month, :duration, :capacity, :condition)
    end

end
