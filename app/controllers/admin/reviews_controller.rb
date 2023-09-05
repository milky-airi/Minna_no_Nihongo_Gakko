class Admin::ReviewsController < ApplicationController

  def index
    @reviews = Review.all
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    review = Review.find(params[:id])
    review.update(review_params)
    redirect_to admin_reviews_path
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
