class Admin::SchoolsController < ApplicationController

  def new
    @school = School.new
  end

  def create
    # school = School.new(school_params)
    # input_tags = tag_params.split
    # school.create_tags(input_tags)
    # school.save
    # redirect_to schools_path
    school = School.new(school_params)
    input_tags = tag_params[:nationality].split(' ')
    school.create_tags(input_tags)
    school.save
    redirect_to admin_schools_path
  end

  def edit
    @school = School.find(params[:id])
  end

  def update
    school = School.find(params[:id])
    school.update(school_params)
    input_tags = tag_params[:nationality].split(' ')
    school.update_tags(input_tags)
    redirect_to admin_school_path(school.id)
  end

  def index
    @schools = School.all
  end

  def show
    @school = School.find(params[:id])
    @courses = @school.courses
  end

  def destroy
    school = School.find(params[:id])
    school.destroy
    redirect_to admin_schools_path
  end

  # def close
  # end

  private

    def school_params
      params.require(:school).permit(:name, :name_kana, :name_en, :summary, :station, :address, :hp, :facebook, :twitter, :instagram, :tiktok, :youtube, :condition, :anual_fee, :have_dormitory, :dormitory_fee, :is_open, :prefecture)
    end

    def tag_params
      params.require(:school).permit(:nationality)
    end

end
