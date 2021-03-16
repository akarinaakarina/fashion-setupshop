class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :set_post
  before_action :move_to_index, only: [:edit, :update]
  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def set_post
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:image, :nickname, :shop_name, :email, :description)
  end

  def move_to_index
    redirect_to :root if current_user.id != @user.id
  end
end
