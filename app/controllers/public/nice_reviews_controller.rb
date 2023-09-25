class Public::NiceReviewsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]

  def create
    @review = Review.find(params[:review_id])
    nice_review = current_user.nice_reviews.new(review_id: @review.id)
    nice_review.save
    @review.create_nice_notification_by(current_user)
  end

  def destroy
    @review = Review.find(params[:review_id])
    nice_review = NiceReview.find_by(review_id: @review.id, user_id: current_user.id)
    nice_review.destroy
  end

end
