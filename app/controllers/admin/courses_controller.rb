class Admin::CoursesController < ApplicationController
  before_action :authenticate_admin!, only: [:new, :create, :edit, :update, :destroy]

  def new
    @school_id = params[:school_id]
    @course = Course.new
  end


  def create
    course = Course.new(course_params)
    if course.save
      flash[:notice] = "コース情報を追加しました"
      redirect_to admin_school_path(course.school_id)
    else
      flash[:alert] = course.errors.full_messages.join(", ")
      render :new
    end
  end

  def edit
    @course = Course.find(params[:id])
  end

  def update
    course = Course.find(params[:id])
    if course.update(course_params)
      flash[:notice] = "コース情報を更新しました"
      redirect_to admin_school_path(course.school.id)
    else
      flash[:alert] = course.errors.full_messages.join(", ")
      @course = Course.find(params[:id])
      render :edit
    end
  end

  def destroy
    course = Course.find(params[:id])
    course.destroy
    flash[:notice] = "コース情報を削除しました"
    redirect_to admin_school_path(course.school_id)
  end

  private

    def course_params
      params.require(:course).permit(:school_id, :name, :admission_month, :duration, :capacity, :condition)
    end

end
