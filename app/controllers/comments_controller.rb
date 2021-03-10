class CommentsController < ApplicationController
  def create
    comment = Comment.create(comment_params)
    redirect_to "/original_items/#{comment.original_item.id}"
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, original_item_id: params[:original_item_id])
  end
end
