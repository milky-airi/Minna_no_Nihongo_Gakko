class Public::ReviewsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :craete, :edit, :update, :destroy, :indeividual]

  def new
    # @school = School.find(params[:school_id])
  end

  def create
    review = Review.new(review_params)
    review.user_id = current_user.id
    review.school_id = current_user.went_school.id
    if review.save
      if review.is_open
        flash[:notice] = "レビューを投稿しました"
        redirect_to individual_reviews_path(current_user)
      else
        flash[:notice] = "レビューの下書きを保存しました"
        redirect_to individual_reviews_path(current_user)
      end
    else
      flash[:alert] = review.errors.full_messages.join(", ")
      render :new
    end
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    review = Review.find(params[:id])
    if review.update(review_params)
      flash[:notice] = "レビューを更新しました"
      redirect_to review_path(review)
    else
      @review = Review.find(params[:id])
      flash[:alert] = review.errors.full_messages.join(", ")
      render :edit
    end
  end

  def index
    @reviews = Review.where(is_open: true)
  end

  def show
    @review = Review.find(params[:id])
    @comments = @review.comments
  end

  def destroy
    review = Review.find(params[:id])
    review.destroy
    redirect_to new_review_path
  end

  def individual
    @review = current_user.review
    @comments = @review.comments
  end

  private

    def review_params
      params.require(:review).permit(:user_id, :school_id, :star_integer, :comment_integer, :evaluation_class, :comment_class, :evaluation_after_graduation, :comment_after_graduation, :evaluation_place, :comment_place, :evaluation_facility, :comment_facility, :evaluation_student, :comment_student, :evaluation_teacher, :comment_teacher, :evaluation_life, :comment_life, :is_open)
    end

end
