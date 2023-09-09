class Admin::SchoolsController < ApplicationController
  before_action :authenticate_admin!

  def new
    @school = School.new
  end

  def create
    school = School.new(school_params)
    input_tags = tag_params[:nationality].split(' ')
    school.create_tags(input_tags)
    if school.save
      flash[:notice] = "学校情報を登録しました"
      redirect_to admin_schools_path
    else
      flash[:alert] = school.errors.full_messages.join(", ")
      render :new
    end
  end

  def edit
    @school = School.find(params[:id])
  end

  def update
    school = School.find(params[:id])
    if school.update(school_params)
      input_tags = tag_params[:nationality].split(' ')
      school.update_tags(input_tags)
      flash[:notice] = "学校情報を更新しました"
      redirect_to admin_school_path(school.id)
    else
      @school = School.find(params[:id])
      flash[:alert] = school.errors.full_messages.join(", ")
      render :edit
    end
  end

  def index
    @schools = School.all.page(params[:page]).per(10).order(created_at: :desc)
  end

  def show
    @school = School.find(params[:id])
    @courses = @school.courses
  end

  def destroy
    school = School.find(params[:id])
    school.destroy
    flash[:notice] = "学校情報を削除しました"
    redirect_to admin_schools_path
  end

  # def close
  # end

  private

    def school_params
      params.require(:school).permit(:name, :name_kana, :name_en, :summary, :station, :address, :hp, :facebook, :twitter, :instagram, :tiktok, :youtube, :condition, :anual_fee, :have_dormitory, :dormitory_fee, :is_open, :prefecture, :image, :image_from)
    end

    def tag_params
      params.require(:school).permit(:nationality)
    end

end
