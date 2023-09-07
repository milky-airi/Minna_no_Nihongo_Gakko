class Public::ReviewsController < ApplicationController
  before_action :authenticate_user!

  def new
    # @school = School.find(params[:school_id])
  end

  def create
    review = Review.new(review_params)
    review.user_id = current_user.id
    review.school_id = params[:school_id]
    if review.save
      redirect_to review_path(review.id)
    else
      render :new
    end
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    review = Review.find(params[:id])
    review.update(review_params)
    redirect_to review_path(review)
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
    redirect_to school_path(review.school.id)
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
