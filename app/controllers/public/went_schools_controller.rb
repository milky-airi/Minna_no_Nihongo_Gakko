class Public::WentSchoolsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :craete, :edit, :update, :destroy]

  def new
  end

  def create
    went_school = WentSchool.new(went_school_params)
    went_school.user_id = current_user.id
    if went_school.save
      redirect_to user_path(current_user)
    else
      render :new
    end
  end

  def edit
    @went_school = current_user.went_school
    # @went_school = WentSchool.find_by(user_id: current_user.id)
  end

  def update
    # went_school = WentSchool.find_by(user_id: current_user.id)
    went_school = current_user.went_school
    if went_school.update(went_school_params)
      redirect_to user_path(current_user)
    else
      @went_school = current_user.went_school
      render :edit
    end
  end

  def destroy
    went_school = current_user.went_school
    went_school.destroy
    redirect_to user_path(current_user)
  end

  private

    def went_school_params
      params.require(:went_school).permit(:school_id, :user_id, :graduate_year, :graduate_month)
    end
end
