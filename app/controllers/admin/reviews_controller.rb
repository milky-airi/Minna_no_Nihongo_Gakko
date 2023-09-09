class Admin::ReviewsController < ApplicationController
  before_action :authenticate_admin!, only: [:show, :index, :edit, :update, :individual]

  def show
    @review = Review.find(params[:id])
    @comments = @review.comments
  end

  def index
    @reviews = Review.all.page(params[:page]).per(10).order(created_at: :desc)
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    review = Review.find(params[:id])
    if review.update(review_params)
      flash[:notice] = "レビュー情報を更新しました"
      redirect_to admin_reviews_path
    else
      flash[:alert] = review.errors.full_messages.join(", ")
      @review = Review.find(params[:id])
      render :edit
    end
  end

  def individual
    @user = User.find(params[:user_id])
    @reviews = Review.where(user_id: @user.id)
  end

  private

    def review_params
      params.require(:review).permit(:user_id, :school_id, :star_integer, :comment_integer, :evaluation_class, :comment_class, :evaluation_after_graduation, :comment_after_graduation, :evaluation_place, :comment_place, :evaluation_facility, :comment_facility, :evaluation_student, :comment_student, :evaluation_teacher, :comment_teacher, :evaluation_life, :comment_life, :is_open)
    end


end
