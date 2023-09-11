class Public::WentSchoolsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :craete, :edit, :update, :destroy]

  def new
  end

  def create
    went_school = WentSchool.new(went_school_params)
    went_school.user_id = current_user.id
    if went_school.save
      flash[:notice] = "出身校情報を登録しました"
      redirect_to user_path(current_user)
    else
      flash[:alert] = went_school.errors.full_messages.join(", ")
      render :new
    end
  end

  def edit
    @went_school = current_user.went_school
  end

  def update
    went_school = current_user.went_school
    if went_school.update(went_school_params)
      flash[:notice] = "出身校情報を更新しました"
      if current_user.review.present?
        current_user.review.destroy
        flash[:notice] = "出身校情報を更新し、元の出身校に関するレビューを削除しました"
      end
      redirect_to user_path(current_user)
    else
      @went_school = current_user.went_school
      render :edit
    end
  end

  def destroy
    went_school = current_user.went_school
    went_school.destroy
    if current_user.review.present?
        current_user.review.destroy
    end
    flash[:notice] = "出身校情報を削除しました"
    redirect_to user_path(current_user)
  end

  private

    def went_school_params
      params.require(:went_school).permit(:school_id, :user_id, :graduate_year, :graduate_month)
    end
end
