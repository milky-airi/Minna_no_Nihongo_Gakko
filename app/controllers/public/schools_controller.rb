class Public::SchoolsController < ApplicationController

  def show
    @school = School.find(params[:id])
    @courses = @school.courses
    @reviews = @school.reviews.where(is_open: true).page(params[:page]).per(10).order(created_at: :desc)

    # 非公開のスクールの場合、エラーメッセージを表示してリダイレクト
    unless @school.is_open
      redirect_to root_path and return
    end
  end

end
