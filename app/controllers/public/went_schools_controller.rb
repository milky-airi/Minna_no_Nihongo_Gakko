class Public::WentSchoolsController < ApplicationController

  def new
  end

  def create
    went_school = WentSchool.new(went_school_params)
    went_school.user_id = current_user.id
    went_school.save
    redirect_to user_path(current_user)
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

    def went_school_params
      params.require(:went_school).permit(:school_id, :user_id)
    end
end
