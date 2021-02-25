class UsersController < ApplicationController
  def show
    user = User.find(params[:id])
    @shop_name = user.shop_name
    @original_items = user.original_items
  end
end
