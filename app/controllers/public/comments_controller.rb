class Public::CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :update, :destroy]

  def create
    comment = Comment.new(comment_params)
    comment.user_id = current_user.id
    comment.review_id = params[:comment][:review_id]
    comment.save
    redirect_to review_path(comment.review_id)
  end

  def update
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    redirect_to review_path(comment.review_id)
  end

  private

    def comment_params
      params.require(:comment).permit(:user_id, :review_id, :comment, :is_open)
    end

end
