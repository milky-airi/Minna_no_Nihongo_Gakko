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
    redirect_to schools_path
  end

  def edit
  end

  def update
  end

  def index
    @schools = School.all
  end

  def show
  end

  def destroy
  end

  def close
  end

  private

    def school_params
      params.require(:school).permit(:school_name, :school_name_kana, :school_name_en, :summary, :station, :address, :hp, :facebook, :twitter, :instagram, :tiktok, :youtube, :condition, :anual_fee, :have_dormitory, :is_open, :prefecture)
    end

    def tag_params
      params.require(:school).permit(:nationality)
    end

end
