class LikesController < ApplicationController
  def index
    @original_item = OriginalItem.find(params[:id])
  end
  def create
    @like = current_user.likes.create(original_item_id: params[:original_item_id])
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @like = Like.find_by(original_item_id: params[:original_item_id], user_id: current_user.id)
    @like.destroy
    redirect_back(fallback_location: root_path)
  end
end
