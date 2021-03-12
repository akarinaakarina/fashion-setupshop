class OriginalItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :search]
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, only: [:edit, :update, :destroy]

  def index
    @original_items = OriginalItem.includes(:user).order('created_at DESC')
  end

  def new
    @original_item = OriginalItem.new
  end

  def create
    @original_item = OriginalItem.new(original_item_params)
    if @original_item.save
      redirect_to :root
    else
      render :new
    end
  end

  def show
    @comment = Comment.new
    @comments = @original_item.comments.includes(:user)
    @like = Like.new
  end

  def edit
  end

  def update
    if @original_item.update(original_item_params)
      redirect_to :original_item
    else
      render :edit
    end
  end

  def destroy
    @original_item.destroy
    redirect_to :root
  end

  def search
    if params[:keyword].present?
      @original_items = OriginalItem.where('name LIKE ?', "%#{params[:keyword]}%")
    else
      @original_items = OriginalItem.all
    end
  end

  private

  def set_post
    @original_item = OriginalItem.find(params[:id])
  end

  def original_item_params
    params.require(:original_item).permit(:image, :name, :description, :state_id, :category1_id, :category2_id, :size_id, :color_id, :delivery_style_id, :prefecture_id,
                                          :delivery_day_id, :price).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index if current_user.id != @original_item.user.id || @original_item.buy.present?
  end
end
