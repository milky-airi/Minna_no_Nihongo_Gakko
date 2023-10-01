class Public::CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]

  def create
    comment = Comment.new(comment_params)
    comment.user_id = current_user.id
    comment.review_id = params[:comment][:review_id]
    comment.score = Language.get_data(comment_params[:comment])
    if comment.save
      @review = comment.review
      @review.create_notification_by(current_user)
    else
      flash[:alert] = comment.errors.full_messages.join(", ")
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    @review = comment.review
    comment.destroy
  end

  private

    def comment_params
      params.require(:comment).permit(:user_id, :review_id, :comment, :is_open)
    end

end
